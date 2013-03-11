From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Mar 2013 22:26:30 +0100
Subject: [Buildroot] [PATCH] change default location for local.mk to
 $(CONFIG_DIR)
In-Reply-To: <1362653363-24915-1-git-send-email-jeremy.rosen@openwide.fr>
References: <1362653363-24915-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <20130311222630.5a75029d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?my Rosen,

On Thu,  7 Mar 2013 11:49:23 +0100, J?r?my Rosen wrote:
> the previous default of $(TOPDIR) broke the philosophy of builds with O=
> which try to keep all configuration files within the $(CONFIG_DIR)
> subtree

Hum, that's an interesting vision of things. I think I would tend to
agree with this idea.

What do others think?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
