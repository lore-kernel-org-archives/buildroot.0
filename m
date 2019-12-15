From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2019 17:40:28 +0100
Subject: [Buildroot] [PATCH 4/4] package/tpm2-tools: bump to version 4.1
In-Reply-To: <20191214232602.3337220-4-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 15 Dec 2019 00:26:02 +0100")
References: <20191214232602.3337220-1-fontaine.fabrice@gmail.com>
 <20191214232602.3337220-4-fontaine.fabrice@gmail.com>
Message-ID: <87fthlee4j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Drop patch (already in version)
 > - Update hash of license file (copyrights retained since version 4.0 and
 >   https://github.com/tpm2-software/tpm2-tools/commit/e4b469724eaa6eff0a1ce3bce9fd2ab9e010cd3b)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  > +++ b/package/tpm2-tools/tpm2-tools.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -TPM2_TOOLS_VERSION = 3.1.4
 > +TPM2_TOOLS_VERSION = 4.1
 >  TPM2_TOOLS_SITE = https://github.com/tpm2-software/tpm2-tools/releases/download/$(TPM2_TOOLS_VERSION)
 >  TPM2_TOOLS_LICENSE = BSD-3-Clause
 >  TPM2_TOOLS_LICENSE_FILES = LICENSE

Committed after ensuring pandoc would not be detected so man pages are
not built, thanks.

-- 
Bye, Peter Korsgaard
