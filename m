From: Jigar SOLANKI <jigar.solanki@labri.fr>
Date: Wed, 11 Jan 2012 13:12:25 +0100
Subject: [Buildroot] Fwd: Re: Cant type anything into Serial Console login
Message-ID: <69d6daaa-60fe-42e2-9ecf-7017d0e35ce7@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


-- 
Jigar SOLANKI 

Envoy? de mon smartphone Android avec K-9 Mail. Excusez la brievet?.


Jigar SOLANKI <jigar.solanki@labri.fr> a ?crit :

Thanks for the quick reply. What is hardware flow control and how to disable it? Didnt know that feature.
-- 
Jigar SOLANKI 

Envoy? de mon smartphone Android avec K-9 Mail. Excusez la brievet?.


Will Newton <will.newton@gmail.com> a ?crit :

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

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120111/02853cf4/attachment.html>
