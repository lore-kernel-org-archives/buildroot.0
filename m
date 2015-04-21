From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Apr 2015 23:47:37 +0200
Subject: [Buildroot] [PATCH] rtai: remove option
 BR2_LINUX_KERNEL_EXT_RTAI_PATCH
In-Reply-To: <5536C4ED.3010008@mind.be>
References: <1429652188-11586-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <5536C4ED.3010008@mind.be>
Message-ID: <20150421234737.03dbb086@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Tue, 21 Apr 2015 23:45:17 +0200, Arnout Vandecappelle wrote:

>  This requires legacy handling. With in the help text something like
> 
> 	  The BR2_LINUX_KERNEL_EXT_RTAI_PATCH option never worked, so it is
> 	  probably not useful. If you do have a valid use case and it used to
> 	  work for you, please let us know on buildroot at buildroot.net.

Well, I talked about Config.in.legacy handling in the commit message:

"""
Bottom line is that this feature has never worked, so there is not
even a point in adding Config.in.legacy support for it.
"""

Should I understand that you don't agree with this reasoning, and still
want Config.in.legacy handling?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
