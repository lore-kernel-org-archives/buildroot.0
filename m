From: Fabien Marteau <fabien.marteau@armadeus.com>
Date: Thu, 18 Jul 2013 09:50:05 +0200
Subject: [Buildroot] [PATCH 0/1] package/python-pyro: Adding Python module
	Pyro 3.14
Message-ID: <1374133806-9162-1-git-send-email-fabien.marteau@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This is not the last version of Pyro (last version is Pyro4 4.20) but this
version is needed by Beremiz (a PLC development tools).

https://pypi.python.org/pypi/Pyro/3.14

Beremiz:
http://www.beremiz.org/

Thanks,

FabienM

Fabien Marteau (1):
  package/python-pyro: adding Pyro 3.14

 package/python-pyro/Config.in      |    9 +++++++++
 package/python-pyro/python-pyro.mk |   17 +++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 package/python-pyro/Config.in
 create mode 100644 package/python-pyro/python-pyro.mk

-- 
1.7.10.4
