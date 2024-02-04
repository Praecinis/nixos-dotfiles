{ config, pkgs, ... }:

{
  programs.wofi = {
    enable = true;
    style = ''
    #window {
      font-family: "DejaVu Sans Mono", "Font Awesome 5 Free";
      margin: 0px;
      border: 1px solid rgba(50, 58, 164, 0.2);
      background-color: rgba(255,255,255,0.7);  
    }

    #input {
      margin: 5px;
      border: none;
      color: #323AA4;
/*rgba(255,255,255,0.7);  */
    }

    #outer-box {   
      border: none;
    }
    
    #scroll {
     margin: 0px;
     border: none;
     color: #2F277C;
    }

    #entry {
      border: 0px;
    }

    #entry:focused {
      border: 0px;
    }
    
    #entry:selected {
      background-color: rgba(50, 58, 164, 0.5);
      border: 0px;
    }

    #text {
      margin: 5px;
      color: black;
    }
    '';
  };
}
