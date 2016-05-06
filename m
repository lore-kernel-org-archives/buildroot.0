From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 May 2016 15:48:32 +0200
Subject: [Buildroot] [PATCH v4] barebox: add an option to embed
 environment image
In-Reply-To: <1462513564-11289-1-git-send-email-yegorslists@googlemail.com>
References: <1462513564-11289-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160506154832.1b1e7c88@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  6 May 2016 07:46:04 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Barebox provides an option to embed a custom environment image into
> barebox binary. This image will be used, when the environment found
> in the environment sector is invalid. Both embedded and external
> images can be used together, so having both options at the same
> time is justified.
> 
> This patch sets barebox Kconfig option CONFIG_DEFAULT_ENVIRONMENT_PATH
> to user specified path. This way one can use such BR's variables like
> BR2_EXTERNAL, TOPDIR etc. to provide paths to custom environment folders.
> 
> Cc: Pieter Smith <pieter@boesman.nl>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> Changes:
> 	v4: reword help text (Arnout Vandecappelle)
> 	    add auxiliary variable holding env path (Arnout Vandecappelle)
> 	    add notion about having both env images in parallel to commit message (Thomas Petazzoni)

Applied to master, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
