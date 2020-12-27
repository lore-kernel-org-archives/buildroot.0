From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 08:50:23 +0100
Subject: [Buildroot] [PATCH] libcurl: security bump to version 7.74.0
In-Reply-To: <d29e572b126866f1a91ea9ef1befceff4744f01c.1608816139.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 24 Dec 2020 15:22:19 +0200")
References: <d29e572b126866f1a91ea9ef1befceff4744f01c.1608816139.git.baruch@tkos.co.il>
Message-ID: <87sg7rd6ww.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes security issues:
 > CVE-2020-8286: Inferior OCSP verification

 > CVE-2020-8285: FTP wildcard stack overflow

 > CVE-2020-8284: trusting FTP PASV responses

 > Drop upstream patch.

 > Cc: Matt Weber <matthew.weber@rockwellcollins.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2020.02.x, 2020.08.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
