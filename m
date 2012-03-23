From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Mar 2012 16:32:18 +0100
Subject: [Buildroot] [PATCH v3] Add dtc (device tree compiler) as host
 tool
In-Reply-To: <20120323150517.GS444@game.jcrosoft.org>
References: <0e9c281db61ec6c47a7a.1332513454@beantl019720>
 <20120323155103.54f93fa3@skate>
 <20120323150517.GS444@game.jcrosoft.org>
Message-ID: <20120323163218.5915f640@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 23 Mar 2012 16:05:18 +0100,
Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> a ?crit :

> dtc is always provuded with the kernel so why do you need it?

The sources are always available, but it is *built* only if CONFIG_DTC
is selected. So unconditionally installing scripts/dtc/dtc will not
work if the kernel was configured !CONFIG_DTC.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
