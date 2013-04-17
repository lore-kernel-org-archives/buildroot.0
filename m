From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Apr 2013 09:46:32 +0200
Subject: [Buildroot] [PATCH] ne10: new package
In-Reply-To: <516E462B.20309@mind.be>
References: <1365876586-7824-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <516E462B.20309@mind.be>
Message-ID: <20130417094632.35f60b6e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 17 Apr 2013 08:50:19 +0200, Arnout Vandecappelle wrote:

>   Shouldn't the latter one be inside an ifeq ($(BR2_PREFER_STATIC_LIB),) 
> as well? But then you probably need an else part as well to override the 
> default commands.

Yes, you're right. I'll send a followup patch. Thanks for noticing!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
