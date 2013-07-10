From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Jul 2013 09:18:00 +0200
Subject: [Buildroot] where is 'ldd'?
In-Reply-To: <20130709174306.GT5098@tarshish>
References: <20130708135640.GA7070@zuhnb712> <51DAC94D.2030706@gmail.com>
 <20130708142743.GB11258@zuhnb712>
 <CAAXf6LU3ShNk9JdG-eVv7Lt3OLopP5butkPK-8Mb4L+3gmRzxg@mail.gmail.com>
 <20130709124030.530d3a3e@skate>
 <CAAXf6LV9K=KmTRK9cfZRRztZiZWE1q0MeLtvupuj3j+1jzLkaw@mail.gmail.com>
 <20130709174306.GT5098@tarshish>
Message-ID: <20130710091800.5d8e42a7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue, 9 Jul 2013 20:43:06 +0300, Baruch Siach wrote:

> Trying on uClibc (0.9.33.2) xtensa target I see:
> 
> # LD_TRACE_LOADED_OBJECTS=1 /bin/busybox
>     libc.so.0 => /lib/libc.so.0 (0x20008000)
>     ld-uClibc.so.0 => /lib/ld-uClibc.so.0 (0x20000000)

Nice, thanks for testing!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
