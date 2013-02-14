From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Feb 2013 15:46:49 +0100
Subject: [Buildroot] [PATCH] linux: add option to get sources from
 custom directory
In-Reply-To: <20130214143237.GA3826@mail.sceen.net>
References: <1354873604-4304-1-git-send-email-rbraun@sceen.net>
 <20121212105418.601702fc@skate>
 <20121212101407.GA9848@mail.sceen.net> <50D0AA87.7010404@mind.be>
 <20130214143237.GA3826@mail.sceen.net>
Message-ID: <20130214154649.1676a3f1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Richard Braun,

On Thu, 14 Feb 2013 15:32:37 +0100, Richard Braun wrote:

> >  I agree. I think that if we provide several methods of downloading
> > in the menuconfig, then all SITE_METHODs should ideally be
> > supported. In particular svn is probably also of interest to some
> > people.
> 
> Ping.

Rafal Fabich has submitted "[PATCH v2] Added local directory as soure
of kernel code" today, which seems to implement what you want. If you
could test it and add your Tested-by on the patch, it would be great.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
