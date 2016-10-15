From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 19:42:45 +0200
Subject: [Buildroot] [PATCH 00/51] TLP/PPS: intro, package cleanup.
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <20161015194245.716c6d2b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Oct 2016 19:13:07 -0300, gustavo.zacarias at free-electrons.com
wrote:

> The patches are one per package to simplify the review/application
> process and to make it easy to revert with granularity in case of
> problems with one or more of them.

[...]

Many of the patches have been applied. However, a few of the patches
had comments, so can you respin them?

I've marked the following patches as Changes Requested in patchwork:

  ocrad: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  moarvm: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  pppd: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  poco: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  librtas: use $(TARGET_MAKE_ENV) when calling $(MAKE)
  ed: use $(TARGET_MAKE_ENV) when calling $(MAKE) 

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
