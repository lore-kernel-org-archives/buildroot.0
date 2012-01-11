From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 11 Jan 2012 18:36:15 +0100
Subject: [Buildroot] [PATCH 1/2] Rework of shutdown policy in inittab
In-Reply-To: <9620f2c623d3fdb946abdaa3ce694d6ee441f940.1326301656.git.maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Wed, 11 Jan 2012 18:09:22 +0100")
References: <cover.1326301656.git.maxime.ripard@free-electrons.com>
 <cover.1326301656.git.maxime.ripard@free-electrons.com>
 <9620f2c623d3fdb946abdaa3ce694d6ee441f940.1326301656.git.maxime.ripard@free-electrons.com>
Message-ID: <874nw29m5s.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> This commit follows commit ad501b66. Start up of the busybox logging
 Maxime> daemons were moved to an init script but the shutdown were still
 Maxime> performed in inittab. This commit moves the shutdown policy to an
 Maxime> rcK script that calls the stop function of all the init scripts in
 Maxime> a reversed order.

Committed, thanks.

-- 
Bye, Peter Korsgaard
