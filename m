From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 9 Apr 2018 22:52:05 +0200
Subject: [Buildroot] [PATCH 1/1] cryptopp: bump to version 7.0.0
In-Reply-To: <20180409224757.5fb35210@windsurf>
References: <20180409204156.5626-1-fontaine.fabrice@gmail.com>
 <20180409224757.5fb35210@windsurf>
Message-ID: <CAPi7W83eDK7rAigZt_uNcbbxmZr54LVg4VJi9-m9-DbhZopu2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

2018-04-09 22:47 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:

> Hello,
>
> On Mon,  9 Apr 2018 22:41:56 +0200, Fabrice Fontaine wrote:
> > Remove all patches (applied upstream)
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> On which Buildroot version is this based? It doesn't apply here:
>
> Arf sorry, I forgot that I add uncommited patches on my local branch. I
will fix this patch.

> thomas at windsurf:~/projets/buildroot (master)$ git pwam 896410
> Applying patch #896410 using 'git am -s'
> Description: [1/1] cryptopp: bump to version 7.0.0
> Applying: cryptopp: bump to version 7.0.0
> error: patch failed: package/cryptopp/0001-Fix-GCC-
> version-for-RDSEED-intrinsic.patch:1
> error: package/cryptopp/0001-Fix-GCC-version-for-RDSEED-intrinsic.patch:
> patch does not apply
> error: package/cryptopp/0002-Define-AT_HWCAP-AT_HWCAP2-if-getauxval-unavailable.patch:
> does not exist in index
> error: package/cryptopp/0003-Allow-user-to-set-DCRYPTOPP_ARM_NEON_AVAILABLE-0.patch:
> does not exist in index
> error: patch failed: package/cryptopp/cryptopp.mk:4
> error: package/cryptopp/cryptopp.mk: patch does not apply
> Patch failed at 0001 cryptopp: bump to version 7.0.0
> The copy of the patch that failed is found in: .git/rebase-apply/patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> 'git am' failed with exit status 128
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180409/e0136b05/attachment.html>
