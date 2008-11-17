From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 Nov 2008 08:13:47 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
In-Reply-To: <20081116234622.GG16858@cloud.net.au> (Hamish Moffatt's message
	of "Mon\, 17 Nov 2008 10\:46\:22 +1100")
References: <20081116172209.0137E3C6D4@busybox.net>
	<20081116234622.GG16858@cloud.net.au>
Message-ID: <871vxa9650.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:

Hi,

 >> ++#error "Sorry, you need at least uClibc version 0.9.30 for id applet to build"
 >> ++#endif
 >> ++#endif
 >> ++
 >> + enum {
 >> + 	PRINT_REAL      = (1 << 0),
 >> + 	NAME_NOT_NUMBER = (1 << 1),

 Hamish> This patch isn't right, id builds if CONFIG_USE_BB_PWD_GRP=y.

Ok, you better tell Denys / the busybox list.

-- 
Bye, Peter Korsgaard
