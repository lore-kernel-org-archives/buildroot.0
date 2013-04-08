From: Arunkumar Vijayakumar <arun.magzion@gmail.com>
Date: Tue, 9 Apr 2013 02:53:44 +0530
Subject: [Buildroot] Including wine package - Reg
In-Reply-To: <20130408231204.0b30b7df@skate>
References: <CAGK4xy6eXjG7MzWS81uNmthwd5ODBB_ae+DQMSFfPkX6_GfQiw@mail.gmail.com>
 <20130408231204.0b30b7df@skate>
Message-ID: <CAGK4xy5fzi5F0C_CaAq0e2JJmdUhNKD3ZuBqE8cBw8dsV+HQrw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas

Thanks for your quick reply.
Im using i386 architecture and the variant to be i686 and creating a
package wine with version 1.5.23. I also used the X Server package for GUI
and followed steps as one in the below link
http://agentoss.wordpress.com/2011/03/06/building-a-tiny-x-org-linux-system-using-buildroot/


Please find the attachment for the config.in & wine.mk file for your
reference.

Let me know if you need any additional details ?
Also let me know why i couldn't able to use file, ldd, readelf commands in
the prompt.

Thanks & Regards
Arun Kumar



On Tue, Apr 9, 2013 at 2:42 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Arunkumar Vijayakumar,
>
> On Tue, 9 Apr 2013 01:19:42 +0530, Arunkumar Vijayakumar wrote:
>
> > I'm including wine package in buildroot to run my windows
> > application. But after building and testing with Qemu, when i type
> > the command wine, its says
> >
> > -sh: wine: not found, even though the wine binaries are in /usr/bin
> >
> > Can you please help me with the solution.
>
> Could you submit your wine package so that we can try to reproduce the
> problem?
>
> Which architecture are you targeting? What is the output of "file
> output/target/usr/bin/wine" ?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130409/eca589d6/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: wine.rar
Type: application/rar
Size: 627 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130409/eca589d6/attachment-0001.rar>
