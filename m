From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jan 2014 14:53:42 +0100
Subject: [Buildroot] [PATCH 1/3] Makefile: use absolute paths to
 BR2_EXTERNAL
In-Reply-To: <44e6c31931f55e79eec713be1a202f2c170667b7.1390424303.git.yann.morin.1998@free.fr>
References: <cover.1390424302.git.yann.morin.1998@free.fr>
 <44e6c31931f55e79eec713be1a202f2c170667b7.1390424303.git.yann.morin.1998@free.fr>
Message-ID: <20140126145342.4c5ccc4e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 22 Jan 2014 21:59:34 +0100, Yann E. MORIN wrote:

> +is interpreted relative to the main Buildroot source directory, not
> +the Buildroot output directory. Using relative paths can lead to various
> +broken setups, and thus is highly discouraged in favour of using
> +absolute paths.

In this patch and in patch 3/3, I don't quite agree with the strong
suggestion to use absolute paths. I personally find the usage of
absolute paths ugly, and prefer to have in the manual an explanation on
how the paths are interpreted, so that the users can understand how to
properly use either relative paths or absolute paths as they prefer.

To me, a tool that strongly suggests to use absolute paths is broken.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
