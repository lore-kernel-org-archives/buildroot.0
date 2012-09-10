From: Alexandre Belloni <alexandre.belloni@piout.net>
Date: Mon, 10 Sep 2012 18:35:15 +0200
Subject: [Buildroot] Beaglebone build broken ?
In-Reply-To: <CA+-urNTdKF=WeDCcdApGxwXY-LFZB1ti9L9eRGEGMptjviCJ6g@mail.gmail.com>
References: <5049E419.2050408@synopsys.com>
 <CA+-urNTdKF=WeDCcdApGxwXY-LFZB1ti9L9eRGEGMptjviCJ6g@mail.gmail.com>
Message-ID: <20120910163515.GC19037@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, Sep 07, 2012 at 08:49:47AM -0400, Frank Hunleth wrote :
> > 2. Next, it's failing when trying to get the custom kernel.
> >
> > Cloning into bare repository
> > linux-linux-ti33x-psp-3.2-r5a+gitr09e9651bcf2ee8d86685f2a8075bc6557b1d3b91...
> > fatal: The remote end hung up unexpectedly
> > fatal: early EOF
> > fatal: index-pack failed
> > --2012-09-07 12:54:37--
> > http://sources.buildroot.net//linux-linux-ti33x-psp-3.2-r5a+gitr09e9651bcf2ee8d86685f2a8075bc6557b1d3b91.tar.gz
> > Resolving sources.buildroot.net... 176.9.16.109
> > Connecting to sources.buildroot.net|176.9.16.109|:80... connected.
> > HTTP request sent, awaiting response... 404 Not Found
> > 2012-09-07 12:54:38 ERROR 404: Not Found.
> >
> > A few months back I could successfully build bone image so obviously
> > this kernel issue was not present then.
> 
> I remember having an intermittent issue with getting this kernel a
> couple months back and then it went away. This might be transient.
> 
> Having said this, the Beaglebone guys changed how they manage their
> kernel code. Instead of having the whole kernel on GitHub, they now
> just store patches. See
> https://github.com/beagleboard/kernel/tree/beaglebone-3.2. I haven't
> looked into how this would fit into Buildroot, though. Unfortunately,
> once we switched processors, I haven't had time to keep this up to
> date.

We are using the git repo of koen kooi here:

https://github.com/koenkooi/linux.git

If you desire, I can share my buildroot configuration.

Regards,

-- 
Alexandre Belloni
