From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Feb 2017 14:59:47 +0100
Subject: [Buildroot] [PATCH v2 3/3] package/lugaru: new package
In-Reply-To: <20170225133600.15637-3-romain.naour@gmail.com>
References: <20170225133600.15637-1-romain.naour@gmail.com>
 <20170225133600.15637-3-romain.naour@gmail.com>
Message-ID: <20170226145947.57dd33ca@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Feb 2017 14:36:00 +0100, Romain Naour wrote:

> +LUGARU_CONF_OPTS = -DSYSTEM_INSTALL=ON \
> +	-DCMAKE_INSTALL_BINDIR=games \
> +	-DCMAKE_INSTALL_DATADIR=share/games

Why are we passing custom CMAKE_INSTALL_<foo>DIR here?

The rest of the patch looks good to me.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
