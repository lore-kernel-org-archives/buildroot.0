From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 19 Sep 2007 21:13:41 +0200
Subject: [Buildroot] openswan 2.4.9 "natt" patch breaks linux build
In-Reply-To: <1190178221.4516.59.camel@aeglos.sweden.atmel.com>
References: <1190178221.4516.59.camel@aeglos.sweden.atmel.com>
Message-ID: <20070919191341.GB817@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 19, 2007 at 07:03:41AM +0200, Ulf Samuelsson wrote:
>Get the following error when I build for x86.

>Clearly up->pcflag should not be removed.

Yes. The patches from openswan.org look like they are against some
ancient version, i don't know. I've fixed the _BH accounting and a few
other bits.

>I will fix this when I update openswan

Sounds great. TIA,
Bernhard
