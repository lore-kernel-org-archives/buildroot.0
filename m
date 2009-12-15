From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 15 Dec 2009 09:39:18 +0100
Subject: [Buildroot] [PATCH 05/23] uclibc: add avr32 special version
In-Reply-To: <20091215092418.59c33ca8@surf> (Thomas Petazzoni's message of
	"Tue, 15 Dec 2009 09:24:18 +0100")
References: <cover.1260831891.git.thomas.petazzoni@free-electrons.com>
	<3a24927a0e6f041a018085b5a7fc50312001fddc.1260831891.git.thomas.petazzoni@free-electrons.com>
	<20091215081809.071a009e@hcegtvedt.norway.atmel.com>
	<20091215092418.59c33ca8@surf>
Message-ID: <87zl5kpr61.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,
 >> Good, does the generic uClibc configuration enable optimized string
 >> functions?

 Thomas> UCLIBC_HAS_STRING_ARCH_OPT is not set in the generic uClibc
 Thomas> configuration file, if it's the option you're refering to. But
 Thomas> I think we should change this to default to y, since the uClibc
 Thomas> help text says:

Agreed, will do so now.

-- 
Bye, Peter Korsgaard
