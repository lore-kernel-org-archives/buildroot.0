From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 Dec 2009 09:44:09 -0300
Subject: [Buildroot] BR + CT-NG integration
In-Reply-To: <87a5b0800912220437t21fad1e9v7d8b1e15b6ca7981@mail.gmail.com>
References: <200912212351.11487.yann.morin.1998@anciens.enib.fr>	
	<4B30BC14.3050207@zacarias.com.ar>
	<87a5b0800912220437t21fad1e9v7d8b1e15b6ca7981@mail.gmail.com>
Message-ID: <4B30BF19.7030302@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Will Newton wrote:

> I don't know what AXIS internal plans are, but it would appear by "not
> available publically", they mean they are getting out of the chip
> business (selling ETRAX SoCs) and becoming a pure IP supplier. If
> that's the case you will still see CRIS architecture chips but from
> other vendors.

Very unlikely since CRIS is a propietary architecture from Axis which is
probably covered by some patents.
On a limb i'm betting they decided that maintaining their own
architecture wasn't worth the effort and they'll be switching to
something more generally-available like ARM or MIPS.
Remember they're mostly a netcam company, not a silicon or IP one. Their
ARTPEC chips (the engine behind their cams) were never sold, they were
for internal consumption.
Acme systems (www.acmesystems.it) which sold a range of products based
on their Etrax SoCs completely switched to ARM if that's any indication.
