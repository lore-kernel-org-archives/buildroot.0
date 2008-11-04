From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Nov 2008 20:59:01 +0100
Subject: [Buildroot] [PATCH] Kernel build fix related to external
	toolchain use
In-Reply-To: <20081104201021.32179357@surf> (Thomas Petazzoni's message of
	"Tue\, 4 Nov 2008 20\:10\:21 +0100")
References: <20081103101839.6021A3C915@busybox.net>
	<BD79186B4FD85F4B8E60E381CAEE1909C91694@mi8nycmail19.Mi8.com>
	<20081104001754.5fb48c87@surf>
	<BD79186B4FD85F4B8E60E381CAEE1909C9177C@mi8nycmail19.Mi8.com>
	<20081104182314.580215e5@surf> <20081104201021.32179357@surf>
Message-ID: <878wrzz2ii.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Tue, 4 Nov 2008 18:23:14 +0100,
 Thomas> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

 >> 1) remove the option "linux (same version as linux headers)" when an
 >> external toolchain is used ;

 Thomas> Kernel build fix related to external toolchain use

Thanks! Committed as r23924.

-- 
Bye, Peter Korsgaard
