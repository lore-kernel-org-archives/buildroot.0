From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Feb 2017 12:08:40 +0100
Subject: [Buildroot] [PATCH] ruby: assume we always have finite,
	isinf and isnan for uClibc
In-Reply-To: <20170207101802.ftxepyhshb6juvjk@tarshish> (Baruch Siach's
 message of "Tue, 7 Feb 2017 12:18:02 +0200")
References: <20170207094759.45076-1-Vincent.Riera@imgtec.com>
 <20170207101802.ftxepyhshb6juvjk@tarshish>
Message-ID: <87r33atg07.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 >> +ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)

 > IIUC these symbols are always defined (either as macros or as functions), so 
 > why not make this unconditional?

True, but it is really a workaround for uClibc, so I've kept it like
this.

-- 
Bye, Peter Korsgaard
