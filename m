From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue, 26 Aug 2008 18:17:58 +0200
Subject: [Buildroot] Pixman move from package/x11r7 to package?
In-Reply-To: <19164633.post@talk.nabble.com>
References: <19164633.post@talk.nabble.com>
Message-ID: <20080826161757.GD21377@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 26, 2008 at 08:45:14AM -0700, Daniel Laird wrote:
>
>I have noticed that pixman currently lives in x11r7/pixman.  However this
>package is required by later cairo versions(1.6.x) and as such is not X11R7
>specific.  Any one against this being moved into package/pixman?
>Without this later cairo versions will not build and DirectFB on GTK will
>fail.

Putting it into package/pixmap sounds plausible to me. Go ahead.
