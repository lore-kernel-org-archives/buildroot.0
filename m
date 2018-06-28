From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 28 Jun 2018 19:25:32 +0200
Subject: [Buildroot] [PATCH 1/1] gnuradio: needs host-python2
In-Reply-To: <CAGm1_kvcW7h4fpw7pEf5pb_RFX9r0HOr2c=Bv94=xAj_CN34Xg@mail.gmail.com>
References: <20180626214326.27205-1-fontaine.fabrice@gmail.com>
 <20180627033622.23ouuvp2zvr4cw5y@sapphire.tkos.co.il>
 <CAPi7W82WL5MwxnQWri0dg5Ep92fHedomD3XJHLViLGUcr2JwXA@mail.gmail.com>
 <CAPi7W82zbZLPORsXG989MfnFVitVEFELC1FU1GDGk_0n19oMDA@mail.gmail.com>
 <20180628032558.b4bgdv2qdpzssean@tarshish>
 <CAGm1_kuvRh-wam8N-wOyuoyfROc7J_K7FY4SFA55b-Omivmo+g@mail.gmail.com>
 <20180628102352.5a997e68@windsurf.home>
 <CAGm1_kufkaKQ_F=kWy2ihKXq9r6H7bOaNBHoRUfQE89N9-dWYQ@mail.gmail.com>
 <20180628112009.2bf1533a@windsurf.home>
 <CAGm1_kvcW7h4fpw7pEf5pb_RFX9r0HOr2c=Bv94=xAj_CN34Xg@mail.gmail.com>
Message-ID: <CAPi7W81kEgCx815QZcyewyLim-2F1uPYQTzVXG-xAjpi=hrcxA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor,

2018-06-28 12:02 GMT+02:00 Yegor Yefremov <yegorslists@googlemail.com>:

> On Thu, Jun 28, 2018 at 11:20 AM, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> > Hello,
> >
> > On Thu, 28 Jun 2018 11:15:36 +0200, Yegor Yefremov wrote:
> >
> >> > When python3 is enabled for the target, then the default host python
> >> > version is python3. And due to this, all external host Python modules
> >> > are installed for host python3, and not available for host python2.
> >>
> >> You're right. Then for now I see only one quick and dirty hack -
> >> install host versions of six and mako when installing host-python by
> >> default.
> >
> > We also need to take into account the requirements of:
> >
> >   http://patchwork.ozlabs.org/patch/906837/
> >   http://patchwork.ozlabs.org/patch/906838/
> >
> > when designing a solution to solve this problem.
>
> @Fabrice: could you try the latest next branch[1]? It has some Python
> 3 related fixes. Perhaps one doesn't need to enforce python 2 anymore?
>
> [1] https://github.com/gnuradio/gnuradio/commits/next

Next branch builds fine however it seems there is outstanding issues:
https://github.com/gnuradio/gnuradio/issues/1842. What should we do until
an official release is made with python3 support?

>
>
> Yegor
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180628/36e258ed/attachment.html>
