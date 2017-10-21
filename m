From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 18:56:41 +0200
Subject: [Buildroot] [PATCH] uboot: Make Kconfig a default build system
In-Reply-To: <CAML3pwWEC4u5_B9JFgUUTj1XJ2h0YOQe-EweyDYbSacpBPVNwA@mail.gmail.com>
References: <1508602460-4807-1-git-send-email-abrodkin@synopsys.com>
 <20171021183346.19bf1e91@windsurf>
 <CAML3pwWEC4u5_B9JFgUUTj1XJ2h0YOQe-EweyDYbSacpBPVNwA@mail.gmail.com>
Message-ID: <20171021185641.300de9b6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 21 Oct 2017 19:44:35 +0300, ??????? ??????? wrote:

> Ok that makes sense.
> Only 62 of defconfigs mention BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG and
> one mention BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY of totally 96.
> 
> So chances are indeed some of 33 other boards might fail.

Well the defconfigs that are in Buildroot we could easily fix, so it's
not really the issue. The issue is more with all the defconfigs that
people/companies have locally for their own projects.

That being said, it's true at some point, it would make sense to switch
over to Kconfig as the default. The question is when to do that without
breaking things for too many users.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
