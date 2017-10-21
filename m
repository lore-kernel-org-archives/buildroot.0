From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 19:18:56 +0200
Subject: [Buildroot] [PATCH] uboot: Make Kconfig a default build system
In-Reply-To: <CAML3pwWY3=JBX4ZQVuUH=dvYMtuBPaXik64bRjPAm_0MMkdWeQ@mail.gmail.com>
References: <1508602460-4807-1-git-send-email-abrodkin@synopsys.com>
 <20171021183346.19bf1e91@windsurf>
 <CAML3pwWEC4u5_B9JFgUUTj1XJ2h0YOQe-EweyDYbSacpBPVNwA@mail.gmail.com>
 <20171021185641.300de9b6@windsurf>
 <CAML3pwWY3=JBX4ZQVuUH=dvYMtuBPaXik64bRjPAm_0MMkdWeQ@mail.gmail.com>
Message-ID: <20171021191856.31ad31fd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 21 Oct 2017 20:12:49 +0300, ??????? ??????? wrote:

> That's exactly the reason to upstream your stuff.
> What's not in upstream it doesn't exist so why bother?

Come on, people making real products are never going to upstream their
defconfigs to Buildroot. They are highly specific, potentially
confidential. We wouldn't even accept them in Buildroot.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
