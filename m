From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 May 2013 18:29:09 +0200
Subject: [Buildroot] [PATCH v3 00/11] ARC port
In-Reply-To: <E6BF041E97966E4DB955F0DF883AD2D6339FE71E@de02wembxa.internal.synopsys.com>
References: <1367499650-29869-1-git-send-email-mjonker@synopsys.com>
 <20130502172412.6ce3463d@skate>
 <E6BF041E97966E4DB955F0DF883AD2D6339FE71E@de02wembxa.internal.synopsys.com>
Message-ID: <20130502182909.5fa57f95@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mischa Jonker,

On Thu, 2 May 2013 15:30:18 +0000, Mischa Jonker wrote:

> > Hum, what happened to the gcc changes to have the host-bison/host-flex dependencies, 
> > and the changes to make sure that $(HOST_DIR)/usr/bin is in the PATH when building gcc?
> 
> Host-flex, host-bison dependencies for binutils squashed into patch v3 03/11, as you suggested. 

Yeah, for binutils, we're good. I was talking about the ones for gcc.

> I moved the host-flex, host-bison dependencies before the rest of the patches (as suggested), but 
> now I notice that I forgot to include it in the series (doh!). Should I send it separately, or would
> you rather like a v4?

Just send a v4, e-mails are cheap :)

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
