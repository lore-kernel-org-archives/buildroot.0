From: Christopher McCrory <chrismcc@gmail.com>
Date: Thu,  8 Nov 2018 09:09:49 -0800
Subject: [Buildroot] [PATCH 0/1] mariadb and mysql
Message-ID: <20181108170950.30189-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I ran into this again when testing perl-termreadkey.  I started with an
existing config that used perl-dbd-mysql. Thought I would send the
patch I generated a while ago. As an aside, used mariadb because the
oracle-mysql 5.1 version was EOL 5 ish years ago.

Hopefully my commit messages are getting better :)



Christopher McCrory (1):
  mariadb: fix mysql_config when cross compiling

 package/mariadb/mariadb.mk | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.14.5
