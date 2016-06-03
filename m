From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 09:55:42 +0200
Subject: [Buildroot] [PATCH 5/5] python-flask: bump to version 0.11
In-Reply-To: <1464876330-6890-5-git-send-email-yegorslists@googlemail.com>
References: <1464876330-6890-1-git-send-email-yegorslists@googlemail.com>
 <1464876330-6890-5-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160603095542.1ee1cf73@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  2 Jun 2016 16:05:30 +0200, yegorslists at googlemail.com wrote:

> +	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
> +	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime

The "runtime" comment here is not very relevant. Indeed, the
python/python3 package is really a build dependency: it is built before
any target python package.

So I've simply dropped the comment before applying.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
