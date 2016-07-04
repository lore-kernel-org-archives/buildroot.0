From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 3 Jul 2016 21:16:35 -0300
Subject: [Buildroot] ptpd vs ptpd2
In-Reply-To: <87wpl2snzp.fsf@dell.be.48ers.dk>
References: <CANxTyt5W=FBwe6WkNKZ-+4g1oyC2h9=8m-hyECyi37hfOmbq3A@mail.gmail.com>
 <87wpl2snzp.fsf@dell.be.48ers.dk>
Message-ID: <5779AAE3.8090507@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/07/16 13:08, Peter Korsgaard wrote:

>>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:
>
>   > All,
>   > The ptpd Config.in cites: http://ptpd.sourceforge.net/ .  But when I
>   > go there, I get redirected to https://github.com/ptpd/ptpd .
>
>   > The ptpd2 Config.in cites https://github.com/ptpd/ptpd directly.
>
>   > Do we have two recipes for the same package?
>
> They afaik didn't use to be the same at least. Gustavoz, you added both,
> do you know more?

Hi.
The homepage may have changed as usual.
That being said, no, they are not duplicated, ptpd2 implements 1588-2008 
(protocol version 2), ptpd implements 1588-2002 (protocol version 1), 
and they're not forward/backward compatible.
See: https://en.wikipedia.org/wiki/Precision_Time_Protocol
Regards.
