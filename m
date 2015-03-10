From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2015 20:07:28 +0100
Subject: [Buildroot] [PATCH 2/2] package/softether: bump version
In-Reply-To: <1426013917-11263-2-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Tue, 10 Mar 2015 19:58:37 +0100")
References: <1426013917-11263-1-git-send-email-bernd.kuhls@t-online.de>
 <1426013917-11263-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87h9tspt73.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/softether/softether.mk |    2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/softether/softether.mk b/package/softether/softether.mk
 > index 7f2dfb8..ea43877 100644
 > --- a/package/softether/softether.mk
 > +++ b/package/softether/softether.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -SOFTETHER_VERSION = 16b713b98da8dba29f0f845d5a8c36d6f7c34824
 > +SOFTETHER_VERSION = 64fd19e6f849247e3daee765ad278c6bf072afcb

Does this include the patch in 1/2? If so then we should drop that patch
(and if not, why not?)

Anyway, I have in the mean time fixed the clock_gettime issue in the .mk
file:

http://git.buildroot.net/buildroot/commit/?id=766366411386f5bba773042ada58e6379a3d0adf

But we can certainly revert that again once we bump the version.

-- 
Bye, Peter Korsgaard
