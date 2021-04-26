From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 22:33:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx/imx-vpu: fix
 {EULA, COPYING} file hashes
In-Reply-To: <20210420082953.12107-1-sebastien.szymanski@armadeus.com>
 (=?utf-8?Q?=22S=C3=A9bastien?= Szymanski"'s message of "Tue, 20 Apr 2021
 10:29:53 +0200")
References: <20210420082953.12107-1-sebastien.szymanski@armadeus.com>
Message-ID: <875z08hjl2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "S?bastien" == S?bastien Szymanski <sebastien.szymanski@armadeus.com> writes:

 > make legal-info fails on imx-vpu package:
 >>>> imx-vpu 5.4.39.3 Collecting legal info
 > ERROR: EULA has wrong sha256 hash:
 > ERROR: expected: a39da2e94bd8b99eaac4325633854620ea3a55145259c3a7748c610a80714cfc
 > ERROR: got     : 7ffad92e72e5f6b23027e7cf93a770a4acef00a92dcf79f22701ed401c5478c0
 > ERROR: Incomplete download, or man-in-the-middle (MITM) attack

 > ERROR: COPYING has wrong sha256 hash:
 > ERROR: expected: 69cbb76b3f10ac5a8c36f34df7bbdf50825815560c00a946fff2922365ef01a2
 > ERROR: got     : 2ceab29de5ea533b86f570bcc4e9ddbfb5fe85a1da4978a8613ff3fd9bed781d
 > ERROR: Incomplete download, or man-in-the-middle (MITM) attack

 > Fix the hashes of these two files.

 > Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
