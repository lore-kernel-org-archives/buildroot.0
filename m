From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 17 Jan 2012 14:57:12 +0100
Subject: [Buildroot] [PATCH 2/2] New package: kmod
In-Reply-To: <8739bfcusn.fsf@macbook.be.48ers.dk>
References: <1326726276-8442-1-git-send-email-yegorslists@googlemail.com>
 <201201161845.51186.arnout@mind.be> <8739bfcusn.fsf@macbook.be.48ers.dk>
Message-ID: <201201171457.13088.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 16 January 2012 20:27:20 Peter Korsgaard wrote:
> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
>  Arnout> On Monday 16 January 2012 16:04:36 yegorslists at googlemail.com wrote:
>  >> diff --git a/package/kmod/Config.in b/package/kmod/Config.in
>  >> new file mode 100644
>  >> index 0000000..f83237e
>  >> --- /dev/null
>  >> +++ b/package/kmod/Config.in
>  >> @@ -0,0 +1,7 @@
>  >> +config BR2_PACKAGE_KMOD
>  >> +	bool "kmod"
>  >> +	help
>  >> +	  handle kernel modules
>  >> +
>  >> +	  http://git.profusion.mobi/cgit.cgi/kmod.git/
>  Arnout>  That option should set
>  Arnout> KMOD_INSTALL_STAGING = NO
> 
> Why would you not install into staging?

 That should me KMOD_INSTALL_TARGET, of course.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
