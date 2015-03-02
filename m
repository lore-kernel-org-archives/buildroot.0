From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon,  2 Mar 2015 07:55:46 -0300
Subject: [Buildroot] [PATCH v2 0/1] This change adds Perl File::Util module
	(host and target packages)
Message-ID: <1425293747-15440-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At the company I work for (DATACOM) we use a third-party software
whose compilation is performed by a set of Perl scripts which use the
File::Util module. That's why we need the host package.

Of course we could use the Perl packages provided by the host OS but
we prefer to reduce the dependencies with regard to the host OS.

Carlos Santos (1):
  perl-file-util: new package

 package/Config.in                          |  1 +
 package/perl-file-util/Config.in           |  6 ++++++
 package/perl-file-util/perl-file-util.hash |  3 +++
 package/perl-file-util/perl-file-util.mk   | 15 +++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/perl-file-util/Config.in
 create mode 100644 package/perl-file-util/perl-file-util.hash
 create mode 100644 package/perl-file-util/perl-file-util.mk

-- 
1.8.3.1
