From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Apr 2018 22:47:52 +0200
Subject: [Buildroot] [PATCH] mbedtls: security bump to version 2.7.0
In-Reply-To: <e096f49c1c72f1bbd299136397eac58fe385618f.1519361771.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 23 Feb 2018 06:56:11 +0200")
References: <e096f49c1c72f1bbd299136397eac58fe385618f.1519361771.git.baruch@tkos.co.il>
Message-ID: <87r2nm4wlj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > CVE-2018-0487: Remote attackers can execute arbitrary code or cause a
 > denial of service (buffer overflow) via a crafted certificate chain that
 > is mishandled during RSASSA-PSS signature verification within a TLS or
 > DTLS session.

 > CVE-2018-0488: When the truncated HMAC extension and CBC are used,
 > allows remote attackers to execute arbitrary code or cause a denial of
 > service (heap corruption) via a crafted application packet within a TLS
 > or DTLS session.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
