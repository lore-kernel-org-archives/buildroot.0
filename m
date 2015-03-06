From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Mar 2015 23:32:46 +0100
Subject: [Buildroot] [PATCH 0/7] General LTTng packages maintenance
In-Reply-To: <1425663357-22541-1-git-send-email-eeppeliteloop@gmail.com>
References: <1425663357-22541-1-git-send-email-eeppeliteloop@gmail.com>
Message-ID: <20150306233246.11b83af2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Philippe Proulx,

On Fri,  6 Mar 2015 12:35:50 -0500, Philippe Proulx wrote:

>   lttng-libust: rename package to lttng-ust
>   lttng-babeltrace: rename package to babeltrace

To be honest, I am not sure about those ones. Renaming packages causes
backward compatibility problems (that should be handled by adding the
relevant entries in Config.in.legacy, which your patches is not doing),
so renaming just for the sake of renaming, I'm not sure.

Since they lack the Config.in.legacy handling, I'll mark your patches
as Changes Requested in our patch tracking system. When you'll resubmit
them, I'll try to gather the opinion of other Buildroot developers to
see what they think.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
