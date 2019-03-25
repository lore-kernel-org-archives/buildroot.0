From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 18:56:55 +0100
Subject: [Buildroot] [PATCH] package/openjpeg: security bump to latest
 git version
In-Reply-To: <20190312202000.28239-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 12 Mar 2019 21:20:00 +0100")
References: <20190312202000.28239-1-peter@korsgaard.com>
Message-ID: <87r2aultw8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Current git contains fixes for a number of post-2.3.0 security issues:
 > git shortlog --no-merges -i --grep cve --grep overflow --grep zero v2.3.0..
 > Even Rouault (2):
 >       Avoid out-of-bounds write overflow due to uint32 overflow computation on images with huge dimensions.
 >       color_apply_icc_profile: avoid potential heap buffer overflow

 > Hugo Lefeuvre (4):
 >       convertbmp: fix issues with zero bitmasks
 >       jp3d/jpwl convert: fix write stack buffer overflow
 >       jp2: convert: fix null pointer dereference
 >       convertbmp: detect invalid file dimensions early

 > Karol Babioch (2):
 >       jp3d: Replace sprintf() by snprintf() in volumetobin()
 >       opj_mj2_extract: Check provided output prefix for length

 > Stefan Weil (1):
 >       Fix some potential overflow issues (#1161)

 > Young_X (5):
 >       [MJ2] To avoid divisions by zero / undefined behaviour on shift
 >       [JPWL] fix CVE-2018-16375
 >       [JPWL] imagetotga(): fix read heap buffer overflow if numcomps < 3 (#987)
 >       [JPWL] opj_compress: reorder checks related to code block dimensions to avoid potential int overflow
 >       [JP3D] To avoid divisions by zero / undefined behaviour on shift (CVE-2018-14423

 > ichlubna (1):
 >       openjp3d: Int overflow fixed (#1159)

 > setharnold (1):
 >       fix unchecked integer multiplication overflow

 > Drop now upstreamed 0004-install-static-lib.patch.

 > Add a hash for the LICENSE file.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x, 2018.11.x and 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
