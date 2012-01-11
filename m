From: Will Newton <will.newton@gmail.com>
Date: Wed, 11 Jan 2012 11:56:17 +0000
Subject: [Buildroot] Cant type anything into Serial Console login
In-Reply-To: <4F0D76AB.7000508@labri.fr>
References: <4F0D76AB.7000508@labri.fr>
Message-ID: <CAFbHwiT+=wz1vsp9VG5uB=t7ss=m6DRVuuwuzhb=xVyPm0X45w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 11, 2012 at 11:46 AM, Jigar SOLANKI <jigar.solanki@labri.fr> wrote:
> Hi all and happy new year :-)
>
> I'm trying to build a Linux Environment using buildroot on a Leon3
> architecture.
>
> I've managed to compile and successfully run the Linux image with
> initramfs.
> At boot prompt, welcomme tobuildroot, buildroot login, I can't type
> anything in there. The serial console client (I've tried Kermit,
> Minicom, GTKTerm) just hangs, my keyboard is useless at that time.
>
> For what I have googled, I already checked the following :
>
> 1- the kernel command line (console=/dev/ttyS0,115200)
>
> 2- and also checked in target options->generic serial config->put a
> getty on ttyS0, 115200.

Have you made sure to disable hardware flow control?
