From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Dec 2011 17:46:18 +0100
Subject: [Buildroot] [PATCH 3/5] faad2: fix broken build with binutils
 2.22+
In-Reply-To: <1323617160-4360-3-git-send-email-gustavo@zacarias.com.ar>
References: <1323617160-4360-1-git-send-email-gustavo@zacarias.com.ar>
 <1323617160-4360-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20111211174618.109ec5a6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 11 Dec 2011 12:25:58 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> +FAAD2_CONF_ENV = LIBS="-lm"

Instead of this, wouldn't it be better to carry a patch against the
package that makes the necessary modification ? I think a patch has
more chance to get removed appropriately when a new upstream version
that fixes the problem has been released.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
