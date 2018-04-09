From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 22:47:57 +0200
Subject: [Buildroot] [PATCH 1/1] cryptopp: bump to version 7.0.0
In-Reply-To: <20180409204156.5626-1-fontaine.fabrice@gmail.com>
References: <20180409204156.5626-1-fontaine.fabrice@gmail.com>
Message-ID: <20180409224757.5fb35210@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  9 Apr 2018 22:41:56 +0200, Fabrice Fontaine wrote:
> Remove all patches (applied upstream)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

On which Buildroot version is this based? It doesn't apply here:

thomas at windsurf:~/projets/buildroot (master)$ git pwam 896410
Applying patch #896410 using 'git am -s'
Description: [1/1] cryptopp: bump to version 7.0.0
Applying: cryptopp: bump to version 7.0.0
error: patch failed: package/cryptopp/0001-Fix-GCC-version-for-RDSEED-intrinsic.patch:1
error: package/cryptopp/0001-Fix-GCC-version-for-RDSEED-intrinsic.patch: patch does not apply
error: package/cryptopp/0002-Define-AT_HWCAP-AT_HWCAP2-if-getauxval-unavailable.patch: does not exist in index
error: package/cryptopp/0003-Allow-user-to-set-DCRYPTOPP_ARM_NEON_AVAILABLE-0.patch: does not exist in index
error: patch failed: package/cryptopp/cryptopp.mk:4
error: package/cryptopp/cryptopp.mk: patch does not apply
Patch failed at 0001 cryptopp: bump to version 7.0.0
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
'git am' failed with exit status 128

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
