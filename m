From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 30 Mar 2012 20:48:07 +0200
Subject: [Buildroot] x11 and touch screen calibration
In-Reply-To: <20120330170525.242c92e0@skate>
References: <CAGm1_ku7SbH8mbadvcXB5OpZr8=jrUCT=tKJjKXaq7JE2c-RXA@mail.gmail.com>
 <20120330170525.242c92e0@skate>
Message-ID: <CAGm1_kuqdwyBR+rWotpg6MzWsOFH7oCKfzXu20x0=n3yzh0yiw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 30, 2012 at 5:05 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Fri, 30 Mar 2012 16:21:15 +0200,
> Yegor Yefremov <yegorslists@googlemail.com> a ?crit :
>
>> I have a 8" resistive touch screen. The whole stuff is working but
>> rather inaccurate. ts_calibrate and ts_test give good results and
>> after patching Android to use pointercal file I have no problems
>> either.
>>
>> How do I get X11 to use the values from /etc/pointercal? For now I'm
>> using fluxbox, but I'm also open to other managers.
>
> Which X.org input driver are you using? If you want to use the values
> from /etc/pointercal, then you have to go through the tslib X.org input
> driver.
>
> See http://www.pengutronix.de/software/xf86-input-tslib/index_en.html.
>
> We have a package for it in Buildroot.

I have activated the package, but it is not sufficient. It seems that
I'll have to write a xorg.conf or there are other options?

Yegor
