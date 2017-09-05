From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Sep 2017 21:46:13 +0200
Subject: [Buildroot] [PATCH 2/2] docs/manual: add appendix about
	$(HOST_DIR)/usr
In-Reply-To: <027bc1ba0e0b06cd2e353ef8683084b6f9fec926.1504640557.git.yann.morin.1998@free.fr>
References: <cover.1504640557.git.yann.morin.1998@free.fr>
 <027bc1ba0e0b06cd2e353ef8683084b6f9fec926.1504640557.git.yann.morin.1998@free.fr>
Message-ID: <20170905214613.078ce5b5@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Sep 2017 21:42:55 +0200, Yann E. MORIN wrote:

> +Whenever a package installs an executable that is linked with a library
> +in +$(HOST_DIR)/usr/lib+, it must have an RPATH pointing to that directory.

in $(HOST_DIR)/lib, no ?

> +
> +An RPATH pointing to +$(HOST_DIR)/usr/lib+ is no longer accepted.

Otherwise, it is a bit contradictory with what you're saying here.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
