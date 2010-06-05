From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Jun 2010 21:33:27 +0200
Subject: [Buildroot] [PATCH 2/4] gstreamer: Added host-flex and
 host-bison dependencies
In-Reply-To: <1275761030-20955-3-git-send-email-llandwerlin@gmail.com>
References: <1275761030-20955-1-git-send-email-llandwerlin@gmail.com>
	<1275761030-20955-3-git-send-email-llandwerlin@gmail.com>
Message-ID: <20100605213327.4d70f4a4@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  5 Jun 2010 20:03:48 +0200
llandwerlin at gmail.com wrote:

> +GSTREAMER_DEPENDENCIES = libglib2 host-pkg-config host-flex host-bison

This isn't necessary: toolchain/dependencies/dependencies.sh already
checks that the host has flex and bison installed.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
