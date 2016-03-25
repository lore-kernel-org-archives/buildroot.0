From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 25 Mar 2016 22:53:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/libldns: Fix build error
	with	perl 5.10
References: <1458924359-27561-1-git-send-email-bernd.kuhls@t-online.de>
 <8737refd41.fsf@dell.be.48ers.dk>
Message-ID: <5kogscxrmh.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 25 Mar 2016 22:42:54 +0100 schrieb Peter Korsgaard:

>>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls-
zqRNUXuvxA0b1SvskN2V4Q@public.gmane.org> writes:
> I'm not sure what went wrong here, but I cannot apply this patch:
> 
> checking file package/libldns/0004-doxyparse.patch
> checking file package/libldns/0005-doxyparse.patch
> patch: **** malformed patch at line 377:  32, ldns

Hi Peter,

I guess this is because the part of 0005-doxyparse.patch which patches
doc/function_manpages is too long. I had to use "git send-email --
novalidate" to be able to send the patch, the error message before said 
something about smtp problems with long lines.

Please try to fetch the patch from the upstream repo directly:
http://git.nlnetlabs.nl/ldns/commit/doc?
h=develop&id=a56e48856d519d12f1ef600848f335615467f147

Regards, Bernd
