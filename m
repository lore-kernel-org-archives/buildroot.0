From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 22:50:50 +0200
Subject: [Buildroot] [PATCH 1/2] package/freeswitch: disable ClueCon
 invitation messages
In-Reply-To: <20160424102314.55807830@free-electrons.com>
References: <1461445189-31992-1-git-send-email-bernd.kuhls@t-online.de>
 <20160424102314.55807830@free-electrons.com>
Message-ID: <20160501225050.1cff4946@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Apr 2016 10:23:14 +0200, Thomas Petazzoni wrote:

> Doesn't this deserve a separate pre-configure hook? Doing this hidden
> in the FREESWITCH_ENABLE_MODULES hook, with no comment or explanation
> whatsoever looks a bit weird.

I've had no feedback, I'm marking this patch as Changes Requested in
patchwork. Please resend with a separate hook, or a better explanation.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
