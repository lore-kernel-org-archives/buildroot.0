From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 06 Dec 2017 19:50:00 +0100
Subject: [Buildroot] [PATCH 1/1] erlang: Add a patch for hosts without
 libz
References: <20171206144006.3282-1-johan.oudinet@gmail.com>
Message-ID: <onqlfext4h.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 06 Dec 2017 15:40:06 +0100 schrieb Johan Oudinet:

> Since commit 640c988fd4, erts/configure adds -lz to LIBS but this
> variable is also used in some Dynamic Erlang drivers. Fix Makefiles in
> such drivers to use the LDLIBS variable instead.
> 
> This patch has been reported upstream (see ERL-529) and should fix
> http://autobuild.buildroot.net/
results/3a3/3a3b9a4568c706bd6caad3c63d356680c8405ac5/

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
(tested building erlang on minimal Debian stretch system)
