From: Diego Iastrubni <diegoiast@gmail.com>
Date: Mon, 2 Jan 2012 14:14:33 +0200
Subject: [Buildroot] Different runlevels support
In-Reply-To: <1F383CDA589639468828C7E2B75EDE9D096DE3C1@POCITMSEXMB03.LntUniverse.com>
References: <1F383CDA589639468828C7E2B75EDE9D096DE3C1@POCITMSEXMB03.LntUniverse.com>
Message-ID: <CALR4fEKNQp=Ee=V0WQAqeYjE_L5E9Rr=QALLtuUuUhz=wFKEnA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 2, 2012 at 1:02 PM, Mahanteshwari Hiremath <
Mahanteshwari.Hiremath@lnties.com> wrote:

>  Hi,
>     Can anyone tell me buildrrot sysvinit inittab supports for how many
> runlevels?
> as I can only able to see runlevel1 in the inittab provided by sysvinit
> and works fine. If it supports for all, tell me what are the necessary
> changes or selections i have to do to get all runlevels, as i want to
> enable full multiuser mode with x11 login(runlevel 5). This is my generated
> inittab after selecting and building for sysvinit.
>

Busybox's init does not support run levels. All scripts are executed always.


Are you sure you are running sysv init and not busybox?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120102/5e8a8f88/attachment.html>
