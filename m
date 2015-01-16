From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 16 Jan 2015 20:24:23 +0100
Subject: [Buildroot] Fwd: Fwd: Fwd: Fwd: [PATCH v3] linux: add fbtft
 kernel extension
Message-ID: <trinity-02abea49-318b-48e2-9607-f90f11189e17-1421436263043@3capp-gmx-bs34>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Lou,

On Tue, Jan 13, 2015 at 07:20:26PM -0600, Lou Crittenden wrote:
> NEVERMIND NEVERMIND!  Your script works! It turns out I forgot to enable
> the fbtft_device drivers in make linuxconfig. I ran a "make clean all"
> beforehand and forgot I had to run make linuxconfig then run make all.
>

Thats good news....

Regards,
Peter
 
> 
> 
> On Tue, Jan 13, 2015 at 5:19 PM, Lou Crittenden <loucrittenden63@gmail.com>
> wrote:
> 
> > We're getting closer, but no cigar yet.
> >
> > The script runs at boot.
> >
> > I ran /etc/init.d/S30fbtft start to start the script and it outputs:
> >
> > starting waveshare: OK
> >
> > then outputs:
> >
> > FATAL: module fbtft_device not found.
> >
> > and the screen doesn't initialize.
> >
> > The error also shows up while booting up.
> >
> >  I can also run modprobe fbtft_device name=waveshare32b and I get the same
> > error message.
> >
