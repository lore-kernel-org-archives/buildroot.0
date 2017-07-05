From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 11:57:04 +0200
Subject: [Buildroot] [PATCH v3 00/14] Remove /usr component from HOST_DIR
In-Reply-To: <20170704140404.4098-1-arnout@mind.be>
References: <20170704140404.4098-1-arnout@mind.be>
Message-ID: <20170705115704.3341f15b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 4 Jul 2017 16:03:50 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:

> Arnout Vandecappelle (14):
>   Move $(HOST_DIR)/usr/$(GNU_TARGET_NAME) one level up.
>   Move $(HOST_DIR)/usr/lib to $(HOST_DIR)/lib
>   Eliminate $(HOST_DIR)/usr
>   check-host-rpath: no longer check $(HOST_DIR)/usr/{bin,sbin}
>   Makefile: remove $(HOST_DIR)/usr from BR_PATH
>   package/Makefile.in: remove $(HOST_DIR)/usr part from HOST_LDFLAGS
>   gdb: Remove /usr part from installation path of gdbserver
>   gcc-final: things are no longer installed in $(HOST_DIR)/usr
>   pkg-autotools: use $(HOST_DIR) instead of $(HOST_DIR)/usr as prefix
>   pkg-cmake: use $(HOST_DIR) instead of $(HOST_DIR)/usr as prefix
>   pkg-cmake: move configuration files out of $(HOST_DIR)/usr
>   pkg-cmake: programs are now installed in $(HOST_DIR)/bin
>   pkg-python: use $(HOST_DIR) instead of $(HOST_DIR)/usr as prefix
>   pkg-rebar: use $(HOST_DIR) instead of $(HOST_DIR)/usr as prefix

Series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
