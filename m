From: Will Newton <will.newton@gmail.com>
Date: Tue, 22 Dec 2009 12:37:21 +0000
Subject: [Buildroot] BR + CT-NG integration
In-Reply-To: <4B30BC14.3050207@zacarias.com.ar>
References: <200912212351.11487.yann.morin.1998@anciens.enib.fr>
	<4B30BC14.3050207@zacarias.com.ar>
Message-ID: <87a5b0800912220437t21fad1e9v7d8b1e15b6ca7981@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 22, 2009 at 12:31 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> Yann E. MORIN wrote:
>
>> So, on the overall, it's not that bad. Crosstool-NG brings in four archs
>> that buildroot has no support for, while it is missing five archs. For
>> some archs, some work in CT-NG is still needed to support some variants.
>
> The CRIS architecture is somewhat going to vanish since Axis won't be
> selling/supporting the chips publically any longer. Peter might want to
> drop it soonish.
> I also doubt it's in working order at the moment either.
> For a precise timeline of Axis's plans you can see
> http://www.axis.com/products/dev/index.htm
> Regards.

I don't know what AXIS internal plans are, but it would appear by "not
available publically", they mean they are getting out of the chip
business (selling ETRAX SoCs) and becoming a pure IP supplier. If
that's the case you will still see CRIS architecture chips but from
other vendors.
