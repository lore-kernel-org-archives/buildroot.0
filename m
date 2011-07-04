From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2011 16:00:30 +0200
Subject: [Buildroot] [PATCH 5/6] gst-plugins-base: depend on orc if it
 is enabled
In-Reply-To: <1309787685-22269-6-git-send-email-s.neumann@raumfeld.com>
References: <1309787685-22269-1-git-send-email-s.neumann@raumfeld.com>
 <1309787685-22269-6-git-send-email-s.neumann@raumfeld.com>
Message-ID: <20110704160030.2f981c2e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon,  4 Jul 2011 15:54:44 +0200,
Sven Neumann <s.neumann@raumfeld.com> a ?crit :

> -		FT2_CONFIG=/bin/false \
> +		FT2_CONFIG=/bin/ilfalse \

Hm ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
