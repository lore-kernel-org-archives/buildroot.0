From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 00:59:35 +0200
Subject: [Buildroot] [git commit] ptpd2: fix patch 0002 so that it
 applies properly
In-Reply-To: <20181011202228.F01F483476@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Thu, 11 Oct 2018 22:22:18 +0200")
References: <20181011202228.F01F483476@busybox.osuosl.org>
Message-ID: <87a7n4few8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=d60973af00c5ad7dc15049597cf03bd1ad538041
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The patch
 > 0002-ntp_isc_md5-rename-EVP_MD_CTX-into-PTPD_EVP_MD_CTX.patch added in
 > commit 5b7bc560a5859d4b9f0c2a14c10e83c18fbd6bca ("ptpd2: fix build
 > failures due to EVP_MD_CTX conflict and U64 missing") was broken and
 > did not apply correctly.

 > This commit fixes the patch so that it applies properly.

 > Fixes:

 >   http://autobuild.buildroot.net/results/ffa28ee2cecc77d66d934fdb03e1f2014189e45b/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
