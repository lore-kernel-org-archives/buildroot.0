From: Guillaume William Bres <guillaume.bressaix@gmail.com>
Date: Sun, 31 Jul 2016 16:39:40 -0600
Subject: [Buildroot] "no hash found" error for host-gcc-initial-4.9.3
	package verification
Message-ID: <CAJe0E3e22wsz_+x9ztXOS7aZaMPuP4L0PXRoavpwCRJy9VJCww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I want one of my coworkers to build a custom linux image using some default
buildroot stuff. The system builds fine on my machine but it fails on his:


   - Buildroot downloads host-gcc-initial-4.9.3,
   - tries a file verification with either md5sum or sha-sum: error: "ho
   hash found"
   - Buildroot downloads host-gcc initial-4.9.3 from a mirror
   - same problem.


Where does this problem come from? His machine does have md5sum and all
sha-x-sum tools installed, I was able to build the system on mine in the
meantime without any problems.

File verifications should give an error message but not actually cause the
build to stop right?


Guillaume William Bres-Saix
Software engineer - NIST
325 Broadway, Boulder, CO 80305
<guillaume.bressaix@gmail.com>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160731/df7007db/attachment.html>
