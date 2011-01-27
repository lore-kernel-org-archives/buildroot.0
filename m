From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Jan 2011 16:31:40 +0100
Subject: [Buildroot] [PATCH 1/2] ocf: new package
In-Reply-To: <1296140805-24128-1-git-send-email-gustavo@zacarias.com.ar>
References: <1296140805-24128-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20110127163140.18b76fe2@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 27 Jan 2011 12:06:44 -0300
Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:

> +OCF_SRCDIR = $(call qstrip,$(BR2_PACKAGE_OCF_SRC))
> +OCF_BUILDDIR = $(OCF_DIR)

Why is this needed ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
