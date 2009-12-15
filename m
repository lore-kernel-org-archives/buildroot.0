From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 15 Dec 2009 09:23:39 +0100
Subject: [Buildroot] [PATCH 05/23] uclibc: add avr32 special version
In-Reply-To: <876388r72h.fsf@macbook.be.48ers.dk>
References: <cover.1260831891.git.thomas.petazzoni@free-electrons.com>
	<3a24927a0e6f041a018085b5a7fc50312001fddc.1260831891.git.thomas.petazzoni@free-electrons.com>
	<20091215081809.071a009e@hcegtvedt.norway.atmel.com>
	<876388r72h.fsf@macbook.be.48ers.dk>
Message-ID: <20091215092339.04c0b71a@hcegtvedt.norway.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Dec 2009 09:10:30 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

<snipp>

>  >> * Select a different UCLIBC_SITE for avr32 versions in uclibc.mk
>  >> 
>  >> * Add the LINKRELAX=y configuration option to the uClibc .config file
>  >> in uclibc.mk
>  >> 
> 
>  HcE> Good, does the generic uClibc configuration enable optimized string
>  HcE> functions?
> 
> If not, we can probably tweak it.
> 

I think all architectures have optimized string functions, so it should
be safe to enable. If an optimization is not present, it will fallback
to the generic C implementations instead.

-- 
Best regards,
Hans-Christian Egtvedt
