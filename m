From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Dec 2017 06:32:59 +0100
Subject: [Buildroot] [PATCH 00/11] Switch SITE to https for python packages
Message-ID: <20171213053310.17578-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

while fixing
http://autobuild.buildroot.net/results/f73/f7322f19303daa3d403f2c0f13379d947431300d/
I noticed that more packages are using http://pypi.python.org.
This series switches all of them to https://

The initial version of scanpypi used https://
https://git.buildroot.net/buildroot/commit/support/scripts/scanpypi?id=1008ac4406a5544ec87985db880e68377031bca9

Regards, Bernd


Bernd Kuhls (11):
  package/python-keyring: switch SITE to https
  package/python-characteristic: switch SITE to https
  package/python-cheetah: switch SITE to https
  package/python-ipaddr: switch SITE to https
  package/python-pyasn-modules: switch SITE to https
  package/python-pynacl: switch SITE to https
  package/python-pytrie: switch SITE to https
  package/python-shutilwhich: switch SITE to https
  package/python-ujson: switch SITE to https
  package/python-versiontools: switch SITE to https
  package/python-wsaccel:switch SITE to https

 package/python-characteristic/python-characteristic.mk | 2 +-
 package/python-cheetah/python-cheetah.mk               | 2 +-
 package/python-ipaddr/python-ipaddr.mk                 | 2 +-
 package/python-keyring/python-keyring.mk               | 2 +-
 package/python-pyasn-modules/python-pyasn-modules.mk   | 2 +-
 package/python-pynacl/python-pynacl.mk                 | 2 +-
 package/python-pytrie/python-pytrie.mk                 | 2 +-
 package/python-shutilwhich/python-shutilwhich.mk       | 2 +-
 package/python-ujson/python-ujson.mk                   | 2 +-
 package/python-versiontools/python-versiontools.mk     | 2 +-
 package/python-wsaccel/python-wsaccel.mk               | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

-- 
2.11.0
