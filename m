From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 Nov 2008 08:13:00 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
In-Reply-To: <20081116234233.GF16858@cloud.net.au> (Hamish Moffatt's message
	of "Mon\, 17 Nov 2008 10\:42\:33 +1100")
References: <20081113163256.D28F83C8A1@busybox.net>
	<BD79186B4FD85F4B8E60E381CAEE1909D3E78E@mi8nycmail19.Mi8.com>
	<874p28ekyy.fsf@macbook.be.48ers.dk>
	<20081116234233.GF16858@cloud.net.au>
Message-ID: <8763mm966b.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:

Hi,

 >> Yes, busybox 1.13.0 id applet requires functionality not available in
 >> uclibc 0.9.29 / 0.9.28.

 Hamish> OR, you can enable CONFIG_USE_BB_PWD_GRP and busybox will use its
 Hamish> internal getgrouplist (etc) rather than requiring one from libc.

Ahh ok, maybe we should enforce that option if 1.13.0 is used on pre
0.9.30 and id applet is enabled.

-- 
Bye, Peter Korsgaard
