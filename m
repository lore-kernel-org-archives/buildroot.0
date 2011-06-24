From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jun 2011 14:44:33 +0200
Subject: [Buildroot] [PATCH 1/4] package: enhance infrastructure to
 support source dir override
In-Reply-To: <31919307.post@talk.nabble.com>
References: <cover.1305755245.git.thomas.petazzoni@free-electrons.com>
 <c7659f95de05fab6acb0cc1b5e8772a80832fc33.1305755245.git.thomas.petazzoni@free-electrons.com>
 <31919307.post@talk.nabble.com>
Message-ID: <20110624144433.3bdc7bb0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alper,

Le Fri, 24 Jun 2011 05:04:56 -0700 (PDT),
Alper YILDIRIM <yildirimalper@gmail.com> a ?crit :

> We started using your "source override" patches, but we encountered a
> problem.
> Package dependencies are not build when a package source is
> overriden. To overcome this problem we made the following change in
> Makefile.package.in

Yes, this is correct. I also found the problem a few days ago, and
fixed it locally, but I haven't had the time to post a newer version of
the patch set, because I'm fixing other issues with this new feature.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
