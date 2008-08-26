From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Tue, 26 Aug 2008 08:45:14 -0700 (PDT)
Subject: [Buildroot]  Pixman move from package/x11r7 to package?
Message-ID: <19164633.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I have noticed that pixman currently lives in x11r7/pixman.  However this
package is required by later cairo versions(1.6.x) and as such is not X11R7
specific.  Any one against this being moved into package/pixman?
Without this later cairo versions will not build and DirectFB on GTK will
fail.

Daniel Laird
-- 
View this message in context: http://www.nabble.com/Pixman-move-from-package-x11r7-to-package--tp19164633p19164633.html
Sent from the BuildRoot mailing list archive at Nabble.com.
