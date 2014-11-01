From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 18:02:37 +0100
Subject: [Buildroot] [PATCH 1/1] xinetd: change to snapshot.debian.org
 and add hash
In-Reply-To: <1414859755-33664-1-git-send-email-kaszak@gmail.com>
References: <1414859755-33664-1-git-send-email-kaszak@gmail.com>
Message-ID: <20141101180237.6b82f0f4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Karoly Kasza,

On Sat,  1 Nov 2014 17:35:55 +0100, Karoly Kasza wrote:

>  XINETD_VERSION = 2.3.15
> -XINETD_SITE = http://www.xinetd.org
> +XINETD_SOURCE = xinetd_$(XINETD_VERSION).orig.tar.gz
> +XINETD_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/x/xinetd

Just wondering, isn't https://github.com/xinetd-org/xinetd the new
appropriate upstream site?

There is even a 2.3.15 release at
https://github.com/xinetd-org/xinetd/releases.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
