From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 20 Aug 2008 12:16:54 +0200
Subject: [Buildroot] ARM EABI toolchain - anyone build it successfully?
In-Reply-To: <48ABECD6.8000604@wpkg.org>
References: <48AAE812.4020706@wpkg.org> <20080819154955.GA15608@mx.loc>
	<48AAECB6.6020309@wpkg.org> <20080819162809.GA15851@mx.loc>
	<48ABE3DE.80908@wpkg.org> <20080820094942.GA20189@mx.loc>
	<48ABECD6.8000604@wpkg.org>
Message-ID: <20080820101654.GA20285@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 20, 2008 at 12:07:18PM +0200, Tomasz Chmielewski wrote:
> Bernhard Reutner-Fischer schrieb:

>> what CPU did you select? ISTR that i have fixed this for iWMMXT && EABI
>
> BTW, could you point which changes you did to fix this issue for iWMMXT  
> && EABI?

aa42116fd34890d8765e126e11e1466e4f91874f
and
f3ddcec9cb2e6fa27955f3fef11092bebdd6a04b

xscale is supposed to work just fine here.
