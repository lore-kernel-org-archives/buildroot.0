From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Feb 2013 11:13:58 +0100
Subject: [Buildroot] [PATCH v3 2/5] Add python3 config directory simlink
In-Reply-To: <511B65D6.9070003@yahoo.fr>
References: <1360747237-30048-1-git-send-email-kpa_info@yahoo.fr>
 <1360747237-30048-3-git-send-email-kpa_info@yahoo.fr>
 <20130213103319.678c7948@skate> <511B65D6.9070003@yahoo.fr>
Message-ID: <20130213111358.5ae63887@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Patrick,

On Wed, 13 Feb 2013 11:07:18 +0100, Patrick wrote:

> When using host python to install an external module, the setup tools 
> look for a python3.3/config/pyconfig.h file. With the python3 package 
> from buildroot this directory is called config-3.3m. This is why we need 
> to alias config to config-3.3m.

Thanks. This explanation should go in the commit log, and maybe even as
a comment in the code explaining why the symlink is needed.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
