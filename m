From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 19:52:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/{collectd,
 domoticz}: fix outdated dependencies for mosquitto
In-Reply-To: <20200829130339.167330-1-titouan.christophe@railnova.eu> (Titouan
 Christophe's message of "Sat, 29 Aug 2020 15:03:39 +0200")
References: <20200829130339.167330-1-titouan.christophe@railnova.eu>
Message-ID: <874kolfig4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

 > In 4fc62e1eb6b3adbfc3d3eb7f841275ae8cd1b424, we removed arch/toolchain
 > dependencies from the mosquitto library (MMU, !STATIC, SYNC4), and moved
 > them to the mosquitto broker only.

 > All the packages modified here only need the mosquitto library, so they
 > shouldn't have those depends anymore; but this was never done before.

 > Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
