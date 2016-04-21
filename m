From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Apr 2016 23:02:28 +0200
Subject: [Buildroot] [PATCH] i386: properly define BR2_ARCH for all x86
 subarchitectures
In-Reply-To: <57193EB1.5060509@mind.be>
References: <1461268365-13922-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <57193EB1.5060509@mind.be>
Message-ID: <20160421230228.0e8c6663@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 21 Apr 2016 22:57:21 +0200, Arnout Vandecappelle wrote:

> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Thanks!

>   It would be nice if we would have a way to check something like that...

ifeq ($(call qstrip,$(BR2_ARCH)),)
$(error Blurp!)
endif

 ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
