// Set of common plans for cartago

// the goal !focus_env_art is produced by the JaCaMo launcher for the agent to focus on initial artifacts
+!jcm::focus_env_art([],_).
+!jcm::focus_env_art(L,0)   <- .print("Error focusing on environment artifact ",L).

@lf_env_art[atomic]
+!jcm::focus_env_art([H|T],Try)
   <- !jcm::focus_env_art(H,Try);
      !jcm::focus_env_art(T,Try).

+!jcm::focus_env_art(art_env(W,"",_),Try)
   <- //.print("joining workspace ",W);
      joinWorkspace(W,_);
      .print("joinned workspace ",W).
+!jcm::focus_env_art(art_env(W,A,NS),Try)
   <- .print("focusing on artifact ",A," (at workspace ",W,") using namespace ",NS);
      joinWorkspace(W,WId);
      lookupArtifact(A,AId)[wid(WId)];
      NS::focus(AId)[wid(WId)].
-!jcm::focus_env_art(L,Try)
   <- .print("waiting a bit to focus on ",L," try #",Try);
      .wait(200);
      !jcm::focus_env_art(L,Try-1).
