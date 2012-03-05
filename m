From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Mar 2012 10:32:35 +0100
Subject: [Buildroot] [PATCH] qt: Add option to build and install tools
 on the target
In-Reply-To: <1330938235-12713-1-git-send-email-ismael.luceno@gmail.com>
References: <201203042154.05630.arnout@mind.be>
 <1330938235-12713-1-git-send-email-ismael.luceno@gmail.com>
Message-ID: <20120305103235.2208a44f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon,  5 Mar 2012 07:03:55 -0200,
Ismael Luceno <ismael.luceno@gmail.com> a ?crit :

> +	mv $(addprefix $(STAGING_DIR)/usr/bin/,$(QT_TARGET_PROGRAMS-y)) $(TARGET_DIR)/usr/bin

Are you sure this works fine if QT_TARGET_PROGRAMS-y is empty?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
