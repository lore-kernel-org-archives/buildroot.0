From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Fri, 5 Jul 2013 10:52:04 +0800
Subject: [Buildroot] [git commit] bwm-ng: move to appropiate category
In-Reply-To: <51D5A42A.7000205@zacarias.com.ar>
References: <20130605090359.015649A95D@busybox.osuosl.org>
 <CAJhJPsVBJKoRH5W=_iAKv4ReqUMH7=X4EZCX4=4TT6gMn2YK_g@mail.gmail.com>
 <CAJhJPsWQgPbgMcr2b1m2GF58ekx0mVq+QEce++rVqpstDhzh-g@mail.gmail.com>
 <20130704161923.GB5374@free.fr> <51D5A42A.7000205@zacarias.com.ar>
Message-ID: <CAJhJPsVerC9DzBipnAv7sAz3NCRmM7j21p+K0xyqXX+tttMaZQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/7/5 Gustavo Zacarias <gustavo@zacarias.com.ar>

> On 07/04/2013 01:19 PM, Yann E. MORIN wrote:
>
> > Kelvin, Peter, All,
> >
> >> 2013/7/2 Kelvin Cheung <keguang.zhang@gmail.com>
> >>> Hi Gustavo & Peter,
> >>> Last year, I submitted a patch to move bwm-ng from "Networking
> >>> applications" to "System tools".
> >>> Because bwm-ng can monitor not only network bandwidth but also disk-io
> >>> bandwidth.
> >>> So, could you just leave it as it is?
> >
> > Agreed.
>
> Well, sysstat handles I/O bandwidth as well, and it's in hardware
> handling, should we move it too? Or maybe bwm-ng to hardware?
> Most of the time i tend to think "System Tools" as "Basic Tools" (i.e.
> things needed for a system to boot & run, non-busybox based that is).
> For that matter we could also move it to "Debugging, profiling and
> benchmark".
> At least for me it clearly doesn't belong in the System Tools category.
> bwm-ng IMHO would most likely be used to measure network bandwidth
> rather than disk I/O on embedded systems (which usually lack disk).
>

Indeed.
However, you forgot storage devices in embedded systems such as MTD, SD
card and etc.
I believe that some of us are interested in the bandwidth of this kind of
device.
First and last, 'Networking applications' is definitely inappropriate for
bwm-ng.


> Regards.
>
>
>


-- 
Best Regards!
Kelvin Cheung
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130705/3adcf3f5/attachment.html>
