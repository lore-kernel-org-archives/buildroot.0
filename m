From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Jan 2014 09:04:44 +0100
Subject: [Buildroot] buildroot(busybox) problem with ccache during
 rtai-4.0-test2 compiling.
In-Reply-To: <CAEqQue1tHGgSoRZ10S1onLNVoWVTB5wvtHEZoNSsH6rqz-808g@mail.gmail.com>
References: <CAEqQue1sX4nntqoAS-Rynro_8GDkD7hAUd+_CTHDXft_Z0U=CA@mail.gmail.com>
 <20140130200821.2c0559d8@skate>
 <CAEqQue1tHGgSoRZ10S1onLNVoWVTB5wvtHEZoNSsH6rqz-808g@mail.gmail.com>
Message-ID: <20140131090444.725c88d4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear servo gmrt,

On Fri, 31 Jan 2014 10:43:54 +0530, servo gmrt wrote:

>  Thanks for the replay,
> 
>  I am applied rtai-4.0 hal patches to linux source (3.8.13) folder in
> output/build/ directory, and i configured rtai-4.0.
> 
>  I am attaching the buildroot, linux-3.8.13 and rtai-config files for your
> references.

Thanks, but to be able to build RTAI 4.0 altogether, you have certainly
made changes to Buildroot itself. This is the changes I am asking for,
so that I can reproduce your problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
