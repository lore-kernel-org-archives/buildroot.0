From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Sep 2015 23:01:36 +0200
Subject: [Buildroot] [PATCH 1/1] lxc needs gzip scripts for
 lxc-checkconfig runtime
In-Reply-To: <alpine.DEB.2.02.1509202012390.13941@orcam81.orcam.lan>
References: <1442761327-18830-1-git-send-email-yba@tkos.co.il>
 <20150920190622.3f7278c3@free-electrons.com>
 <alpine.DEB.2.02.1509202012390.13941@orcam81.orcam.lan>
Message-ID: <20150920230136.513b491c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jonathan,

On Sun, 20 Sep 2015 20:15:02 +0300 (IDT), Jonathan Ben Avraham wrote:

> I wondered whether to send a patch for each 'select' individually or to 
> wait until I complete my testing and submit a single patch with all of the 
> lxc selects. What do you prefer?

Both solutions are fine with me. You can send patches as you
progressively discover the issues, or send a single patch fixing all
problems at once.

I'm just wondering if we want to make all these dependencies actually
mandatory or not. It seems some of these dependencies are only used for
one specific tool in LXC. If the tool is not crucial in LXC usage,
maybe we should make it optional via a sub-option? I'm not sure here,
just thinking out loud.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
