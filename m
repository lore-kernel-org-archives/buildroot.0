From: Marcelo Gutierrez <kuyurix@gmail.com>
Date: Mon, 3 Feb 2014 14:34:51 -0200
Subject: [Buildroot] Mysql: $(ENABLE_DEBUG) is unset
Message-ID: <CA+kK6WsurjJPB1wzACqx1bNO1GYBRK+u1DAPZXfKCQoNVYiJEA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Configuration options defined in  mysql.mk file, $(ENABLE_DEBUG) is unset.

MYSQL_CONF_OPT = \
--without-ndb-binlog \
--without-server \
--without-docs \
--without-man \
--without-libedit \
--without-readline \
--with-low-memory \
--enable-thread-safe-client \
$(ENABLE_DEBUG)
