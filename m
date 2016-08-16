From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Aug 2016 08:06:35 +0200
Subject: [Buildroot] [PATCH v2] barebox: fix ARCH value for arm64
In-Reply-To: <1471012312-51461-1-git-send-email-poggi.raph@gmail.com> (Raphael
 Poggi's message of "Fri, 12 Aug 2016 16:31:52 +0200")
References: <1471012312-51461-1-git-send-email-poggi.raph@gmail.com>
Message-ID: <87y43xw8lw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Raphael" == Raphael Poggi <poggi.raph@gmail.com> writes:

 > Signed-off-by: Raphael Poggi <poggi.raph@gmail.com>

Committed after extending the commit message to clarify that this is
from 2016.08 onwards as suggested by Baruch, thanks.

> ---
 >  boot/barebox/barebox.mk | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
 > index 832297e..7a110d2 100644
 > --- a/boot/barebox/barebox.mk
 > +++ b/boot/barebox/barebox.mk
 > @@ -61,6 +61,8 @@ else ifeq ($$(KERNEL_ARCH),x86_64)
 >  $(1)_ARCH = x86
 >  else ifeq ($$(KERNEL_ARCH),powerpc)
 >  $(1)_ARCH = ppc
 > +else ifeq ($$(KERNEL_ARCH),arm64)
 > +$(1)_ARCH = arm
 >  else
 >  $(1)_ARCH = $$(KERNEL_ARCH)
 >  endif
 > -- 
 > 2.1.0

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
