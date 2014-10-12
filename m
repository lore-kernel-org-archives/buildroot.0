From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 16:17:03 +0200
Subject: [Buildroot] [PATCH] package/opencv: fix build failure on x86
In-Reply-To: <1413112262-31684-1-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sun, 12 Oct 2014 13:11:02 +0200")
References: <1413112262-31684-1-git-send-email-s.martin49@gmail.com>
Message-ID: <87fvetxti8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > This change adds a patch fixing some opencv asm causing build failures on
 > i*86 with PIC.

 > This patch has been sent upstream [1].

 > Fixes:
 >   http://autobuild.buildroot.org/results/483/4838285b25d6293a5cf0bb9eadd5040a7c75d766/
 >   http://autobuild.buildroot.org/?reason=opencv-2.4.10&&arch=i686

 > [1] https://github.com/Itseez/opencv/pull/3331

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 > ---
 >  ...cv-0001-core-fix-x86-PIC-code-compilation.patch | 49 ++++++++++++++++++++++
 >  1 file changed, 49 insertions(+)
 >  create mode 100644 package/opencv/opencv-0001-core-fix-x86-PIC-code-compilation.patch

Committed, thanks.

-- 
Bye, Peter Korsgaard
