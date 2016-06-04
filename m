From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 4 Jun 2016 20:03:01 +0200
Subject: [Buildroot] [PATCH 1/2] ninja: new package
In-Reply-To: <av9b2dxral.ln2@ID-313208.user.individual.net>
References: <1465047243-1169-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1465047243-1169-2-git-send-email-eric.le.bihan.dev@free.fr>
 <av9b2dxral.ln2@ID-313208.user.individual.net>
Message-ID: <20160604200301.2205a07e@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

Le Sat, 04 Jun 2016 17:50:34 +0200,
Bernd Kuhls <bernd.kuhls@t-online.de> a ?crit :

> please try to add support for python3:

OK, will do!

> What is the purpose of having ninja on the target machine?

Ninja is used by Meson, which I also provide for the target. It is true
that the "Development tools" section now only lists "make" as build
system, since autotools have been removed. I do not know if Buildroot
users frequently need build systems on their target, but I provided it
anyway.

If the policy is to provide build system packages only for the host,
I'm fine with it.

Thanks for the comments.

-- 
ELB
