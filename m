From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 04 Jul 2013 13:34:50 -0300
Subject: [Buildroot] [git commit] bwm-ng: move to appropiate category
In-Reply-To: <20130704161923.GB5374@free.fr>
References: <20130605090359.015649A95D@busybox.osuosl.org>
 <CAJhJPsVBJKoRH5W=_iAKv4ReqUMH7=X4EZCX4=4TT6gMn2YK_g@mail.gmail.com>
 <CAJhJPsWQgPbgMcr2b1m2GF58ekx0mVq+QEce++rVqpstDhzh-g@mail.gmail.com>
 <20130704161923.GB5374@free.fr>
Message-ID: <51D5A42A.7000205@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/04/2013 01:19 PM, Yann E. MORIN wrote:

> Kelvin, Peter, All,
> 
>> 2013/7/2 Kelvin Cheung <keguang.zhang@gmail.com>
>>> Hi Gustavo & Peter,
>>> Last year, I submitted a patch to move bwm-ng from "Networking
>>> applications" to "System tools".
>>> Because bwm-ng can monitor not only network bandwidth but also disk-io
>>> bandwidth.
>>> So, could you just leave it as it is?
> 
> Agreed.

Well, sysstat handles I/O bandwidth as well, and it's in hardware
handling, should we move it too? Or maybe bwm-ng to hardware?
Most of the time i tend to think "System Tools" as "Basic Tools" (i.e.
things needed for a system to boot & run, non-busybox based that is).
For that matter we could also move it to "Debugging, profiling and
benchmark".
At least for me it clearly doesn't belong in the System Tools category.
bwm-ng IMHO would most likely be used to measure network bandwidth
rather than disk I/O on embedded systems (which usually lack disk).
Regards.
