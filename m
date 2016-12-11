From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Dec 2016 14:27:50 +0100
Subject: [Buildroot] [Patch v2 6/9] s6-rc: new package
In-Reply-To: <20161210204112.GA15803@itchy>
References: <1481397650-14664-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1481397650-14664-7-git-send-email-eric.le.bihan.dev@free.fr>
 <20161210195144.bdoczlscimsl5ocz@tarshish>
 <20161210204112.GA15803@itchy>
Message-ID: <20161211142750.419de4bd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 10 Dec 2016 21:41:12 +0100, Eric Le Bihan wrote:

> Yes, no package in the series uses the host variant, but it is provided
> as it allows the user to build the service database offline and include
> it into the root file system (e.g. in a post-build script).

Makes sense, but this should be explained in the commit log, and in the
help text of the Config.in.host option.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
