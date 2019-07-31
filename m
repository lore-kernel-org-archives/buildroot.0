From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jul 2019 08:21:32 +0200
Subject: [Buildroot] [PATCH 1/1] linux: Force CONFIG_NET=y when using
 mdev+devtempfs for /dev management
In-Reply-To: <20190620165944.71127-1-titouan.christophe@railnova.eu> (Titouan
 Christophe's message of "Thu, 20 Jun 2019 18:59:44 +0200")
References: <20190620165944.71127-1-titouan.christophe@railnova.eu>
Message-ID: <87k1by4tcj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

 > Since mdev was switched to the daemon mode introduced in Busybox 1.31.0,
 > it requires CONFIG_NET to be enabled in the kernel such that the mdev
 > daemon can listen to netlink events.

 > Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>

Committed, thanks.

-- 
Bye, Peter Korsgaard
