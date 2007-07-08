From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sun, 8 Jul 2007 12:28:17 +0200
Subject: [Buildroot] [/bin/sh which ar] should be [/bin/sh -c "which ar"]
In-Reply-To: <1183869339.5714.5.camel@elrond.sweden.atmel.com>
References: <1183869339.5714.5.camel@elrond.sweden.atmel.com>
Message-ID: <20070708102817.GE4096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 08, 2007 at 06:35:39AM +0200, Ulf Samuelsson wrote:
>When the host tools are determined in the top Makefile
>(every time make us run) 
>this fails 5 times with the error message:
>
>/usr/bin/which: /usr/bin/which: cannot execute binary file
>
>What happens inside the Makefile is that a command is run:
>$ /bin/sh which ar
>and the bash shell does not like this on my OpenSuSE 10.2 system
>$ /bin/sh -c "which ar"
>will do what we want, so I would like to apply the following patch
>Any comments?

ok, please apply.

Thanks,
