From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Dec 2013 09:20:36 +0100
Subject: [Buildroot] [PATCH] qt5: remove qt5jsbackend package
In-Reply-To: <201312241005.09507.fatih.asici@gmail.com>
References: <1387866891-31546-1-git-send-email-fatih.asici@gmail.com>
 <20131224084545.6163a49e@skate>
 <201312241005.09507.fatih.asici@gmail.com>
Message-ID: <20131224092036.20241d00@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fatih A??c?,

On Tue, 24 Dec 2013 10:05:09 +0200, Fatih A??c? wrote:

> > Do we need a Config.in.legacy symbol for the removal of qt5jsbackend?
> 
> No. Packages depending on qt5jsbackend also depends on qt5declarative. AFAIK, 
> qt5jsbackend is not useful without qt5declarative. So users must have already 
> selected qt5declarative.

Ok, that's a good enough justification for me. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
