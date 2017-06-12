From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jun 2017 15:45:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/erlang-p1-xmpp: Add a missing
 dependency from a selected package
In-Reply-To: <20170612134039.26191-1-johan.oudinet@gmail.com>
References: <20170612134039.26191-1-johan.oudinet@gmail.com>
Message-ID: <20170612154528.1d80a934@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Jun 2017 15:40:39 +0200, Johan Oudinet wrote:
> This package selects erlang-p1-stringprep, which depends on
> BR2_INSTALL_LIBSTDCPP. Thus, it should also depend on this item.

You should give here a reference to the autobuilder issue being fixed.

> 
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
