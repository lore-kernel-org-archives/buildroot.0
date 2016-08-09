From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Aug 2016 22:36:48 +0200
Subject: [Buildroot] [PATCH 2/9] execline: new package
In-Reply-To: <20160809222251.1e58104e@itchy>
References: <1470690140-18803-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1470690140-18803-3-git-send-email-eric.le.bihan.dev@free.fr>
 <20160809100912.0f7738b3@free-electrons.com>
 <20160809222251.1e58104e@itchy>
Message-ID: <20160809223648.4d354fd0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 9 Aug 2016 22:22:51 +0200, Eric Le Bihan wrote:

> > Why do we need an option visible in menuconfig to enable this as a
> > host package? Why do we need the host package at all?  
> 
> I made the host variant of execline visible in menuconfig so the end
> user knows it can be used to write post-build script (same goes for
> the host variant of s6-rc). Anyway, if this is supefluous, I will remove
> it.

I'm not sure it's very likely to have users using the execline
scripting language. Maybe we should wait and see if some people need
that?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
