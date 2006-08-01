From: amit bhosale <amitbhosale2000@rediffmail.com>
Date: 1 Aug 2006 10:56:48 -0000
Subject: [Buildroot] Xfbdev:"Could not init font path element
Message-ID: <20060801105648.27234.qmail@webmail47.rediffmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  
 hi sir
  
         I install TinyX and rxvt in my root file system using
     buildroot. (  xc-011010 and rxvt-2.6.4 )

       Now when I try to run Xfbdev in two ways
      
  i) /usr/bin/Xfbdev -fp /usr/X11R6/lib/X11/fonts/misc,
     I get an error saying "Could not init font path element
     /usr/X11R6/lib/X11/fonts/misc, remoing from list!"
     
     and X server is not start.

    but my /usr/X11R6/lib/X11/fonts dir contains
           100dpi  75dpi  cyrillic  local  misc  util

  ii) when i run command Xfbdev with no arguments it display same error
     i.e "Could not init font path element
     /usr/X11R6/lib/X11/fonts/misc, remoing from list!"

   but X server is started.

  so please guide me how to resolve this issue

 Amit 


  

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20060801/b14e9540/attachment.html 
