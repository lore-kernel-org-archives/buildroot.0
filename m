From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2011 09:47:47 +0200
Subject: [Buildroot] [PATCH] fs/skeleton: remove useless logging from
 inittab
In-Reply-To: <1309505931-31799-1-git-send-email-luca@lucaceresoli.net>
References: <1309505931-31799-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20110701094747.6f3438ea@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri,  1 Jul 2011 09:38:51 +0200,
Luca Ceresoli <luca@lucaceresoli.net> a ?crit :

> Currently the default inittab launches a "tail -f /var/log/messages"
> that remains active during the entire target uptime.
> For most embedded systems this is a useless waste of resources, so
> remove it.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
