From: Mauro Condarelli <mcondarelli@soft-in.com>
Date: Fri, 26 Dec 2008 20:06:16 +0100
Subject: [Buildroot] AT91SAM9G20 build .config for linux-2.6.26
Message-ID: <49552B28.5040203@soft-in.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I've been trying to build the whole kernel+rootfs system for my
AT91SAM9G20-EK Rev.B EVA board several times now and always failing, for
one reason or the other.

I tried both the straight instructions from buildroot.uclibc.org and
those from www.linux4sam.org.

I have a working set bootstrap+uboot+linux-2.6.25+rootfs BINARY ONLY!

I am (for the time being) happy with the first two steps and I'm trying
to setup a net boot with tftp+nfs.
I have been able to set-up a server with working tftpd+nfsd that will
boot the original stuff.

Now I'm trying to start from scratch compiling kernel+rootfs.
For several reasons I do *need* to use linux-2.6.26.

As said I tried several (>>10) times to do this with varying
configurations and results... none fully booting.

Sometimes I get a kernel that will not event try to boot (apparently
built for some other microcontroller), sometimes just hanging there
(usually because trying to load the kernel into internal ram; how do I
set link address??), sometimes unable to mount the rootfs.

Pretty please: can someone point me to a basic set of .config's
(buildroot, kernel, uClibc) or, equivalently to a .../local/AT91SAM9G20
subdir?
I need something working I can start from and then modify so suit my
needs; right now I'm wading in a sea of options and about to drown.
To have the options used to compile the at91sam9g20 demo available on
linux4sam (apparently contributed by Nicolas Ferre who, I hope, reads
this in CC:) would be ok.

Thanks in Advance (and Happy New Year!)

Mauro Condarelli

P.S.: The welcome message for the mailing list says to send mail to "buildroot at busybox.net" but it doesn't seem to work. I have to send messages to "buildroot at uclibc.org" instead.  What am I doing wrong?
Best Regards
Mauro
