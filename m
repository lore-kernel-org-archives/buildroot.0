From: Ted Wood <ted@fgh.co.uk>
Date: Tue, 11 Dec 2012 14:12:45 -0000
Subject: [Buildroot] Large File Support
Message-ID: <000901cdd7a9$98377ab0$c8a67010$@co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I hope this isn't an inappropriate place for this...

 

I'm  completely new to Embedded Linux, and am hoping to use Buildroot as the
basis for a new project.

 

I'm using the November 2012 release.

 

I'm trying to build for an i586 using the internal toolchain. The make fails
with the error "It appears you have defined _FILE_OFFSET_BITS=64.
Unfortunately uLibc was built without large file support"

 

I'm pretty sure I didn't request that when I was doing menuconfig. Web
search suggests that this problem has occurred elsewhere. There is an option
to select Large File Support under toolchain, but toggling it makes no
difference.

 

Anybody got any suggestions? 

 

T.

 

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121211/da719da5/attachment.html>
