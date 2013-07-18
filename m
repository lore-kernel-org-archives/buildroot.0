From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 19 Jul 2013 00:34:52 +0200
Subject: [Buildroot] [PATCH 2/4] package/nss-mdns: fix avahi socket
	location
In-Reply-To: <ecbc3969bbc335c75373f15fb7daa9e29248ec5d.1374182572.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Thu, 18 Jul 2013 23:24:13 +0200")
References: <cover.1374182572.git.yann.morin.1998@free.fr>
 <cover.1374182572.git.yann.morin.1998@free.fr>
 <ecbc3969bbc335c75373f15fb7daa9e29248ec5d.1374182572.git.yann.morin.1998@free.fr>
Message-ID: <87a9ljwl83.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> In buildroot, the avahi socket is located in /var/run/avahi-daemon,
 Yann> not in /usr/var/run/avahi-daemon/socket.

Committed, thanks.

-- 
Bye, Peter Korsgaard
