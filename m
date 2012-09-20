From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 21 Sep 2012 00:15:03 +0200
Subject: [Buildroot] [PATCH v2 1/2] Download packages from github in
 tar.gz format instead git format.
In-Reply-To: <1348174101-13388-1-git-send-email-marek.belisko@open-nandra.com>
References: <1348174101-13388-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <505B9567.3070202@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/20/12 22:48, Marek Belisko wrote:
> Verified way how to get packages from github by version or sha1
> (it's enough to use first 7 characters from SHA1):
> 1. by sha1
> FOO_VERSION = 1234567
> FOO_SITE =http://github.com/user/package/tarball/branch
>
> 2. by version
> FOO_VERSION = v1.0
> FOO_SITE =http://github.com/user/package/tarball/$(FOO_VERSION)
>
> Changes from V1:
> - remove unnecessary FOO_SOURCE from mk files and documentation

  The changelog of the patch should go below the Signed-off-by,
separated by a line with
---
This makes sure the patch changelog is not included in the final
git commit message.


> Signed-off-by: Marek Belisko<marek.belisko@open-nandra.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  (re-downloaded the affected packages)

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
