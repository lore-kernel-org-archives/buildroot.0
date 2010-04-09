From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Fri, 9 Apr 2010 15:29:55 +0000 (UTC)
Subject: [Buildroot] bugzilla: problem with "content-disposition" for patch
	files
Message-ID: <hpnh5j$4bm$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This may seem trivial, but it's getting to be pretty annoying.

When you click on a link to a patch file in bubzilla, the
content-disposition is sent as "attachment".  This disables the
ability of Firefox users to set a default action for that file type.

Can this be fixed?

A brief explanation of the problem from http://kb.mozillazine.org/File_types_and_download_actions#Unable_to_set_an_automatic_action

   In some cases, you may not be able to set an automatic download
   action. This can occur when a misconfigured web server assigns an
   incorrect MIME type, such as "application/octet-stream" (shown
   above in SeaMonkey 1.x) or if the server assigns
   "Content-Disposition: attachment" to the file download (shown at
   right in SeaMonkey 1.x). [6] When this happens, the option to
   always perform the same action will either be "grayed-out" (as
   shown here in SeaMonkey 1.x) or, in Firefox, selecting the "Do this
   automatically" option will not seem to have an effect and you will
   again be asked what to do when you next encounter that file type
   (see below for related bug reports). There is little you can do in
   these cases because the problem is at the server end. 

-- 
Grant Edwards               grant.b.edwards        Yow! NANCY!!  Why is
                                  at               everything RED?!
                              gmail.com            
