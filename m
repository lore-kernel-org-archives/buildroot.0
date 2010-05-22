From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 May 2010 09:48:41 +0200
Subject: [Buildroot] [PATCH] xkeyboard-config: Depends on intltool
In-Reply-To: <1274510676-19005-1-git-send-email-paul@pauljones.id.au>
References: <1274510676-19005-1-git-send-email-paul@pauljones.id.au>
Message-ID: <20100522094841.112be57a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 22 May 2010 16:44:36 +1000
Paul Jones <paul@pauljones.id.au> wrote:

> +XKEYBOARD_CONFIG_DEPENDENCIES = intltool

Are you sure it's intltool on the the target that is needed ? I think
it's probably intltool on the host that is needed, isn't it ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
