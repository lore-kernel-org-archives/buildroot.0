From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Aug 2015 16:46:53 +0200
Subject: [Buildroot] [PATCH v4 2015.08 3/4] Makefile: implement a
 size-stats target
In-Reply-To: <CAMQcK5K5RbYUgDgH1VmRE9SSxU=LBEQL=7ph1mnLA2SZokdcCg@mail.gmail.com>
References: <1432591007-27689-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1432591007-27689-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAMQcK5KM=uRUNOZSqu1vieRe4rc5c8+X6WJE5=M_PFxdbo-42w@mail.gmail.com>
 <20150820224356.12a399bb@free-electrons.com>
 <CAMQcK5K5RbYUgDgH1VmRE9SSxU=LBEQL=7ph1mnLA2SZokdcCg@mail.gmail.com>
Message-ID: <20150823164653.6d686931@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Fri, 21 Aug 2015 09:07:26 -0500, Ryan Barnett wrote:

> Not a problem - we have been pretty thoroughly testing these patches
> for the last couple months chasing master. I guess the one thing about
> it being handled by being a "package" is there are no files in the
> build directory. However, if I remember correctly you size-stats
> script monitors the target directory for new files so the skeleton
> package would be handled.

Yes, IIRC the size-stats stuff doesn't take care of anything in the
per-package build directory, it only monitors what gets installed by
each package in the target directory.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
