From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 19 Feb 2017 14:11:57 -0500
Subject: [Buildroot] [PATCH 00/58] python pypi library mass version bump.
Message-ID: <20170219191255.1503-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


These python libraries updated using a tool I created that scanned every
python package with a pypi url, checked if there was a update, and if there
was automatically generated a patch.  It also checks to see if there is any
patches in the patch directory, and if so checks to see if those patches were
applied upstream.

I personally tested to make sure that all of these changes build properly on my
machine before submitting.


Adam Duskett (58):
  python-autobahn: bump to version 0.17.1
  python-backports-abc: bump to version 0.5
  python-beautifulsoup4: bump to version 4.5.3
  python-certifi: bump to version 2017.1.23
  python-cffi: bump to version 1.9.1
  python-cherrypy: bump to version 10.1.1
  python-click: bump to version 6.7
  python-crossbar: bump to version 16.10.1
  python-cryptography: bump to version 1.7.2
  python-cssselect: bump to version 1.0.1
  python-docutils: bump to version 0.13.1
  python-enum: bump to version 0.4.6
  python-enum34: bump to version 1.1.6
  python-flask-login: bump to version 0.4.0
  python-flup: bump to version 1.0.3.dev20161029
  python-httplib2: bump to version 0.10.3
  python-idna: bump to version 2.2
  python-ipaddress: bump to version 1.0.18
  python-ipython: bump to version 5.2.2
  python-jinja2: bump to version 2.9.5
  python-jsonschema: bump to version 2.6.0
  python-mako: bump to version 1.0.6
  python-markdown: bump to version 2.6.8
  python-mbstrdecoder: bump to version 0.2.2
  python-mutagen: bump to version 1.36.2
  python-mwclient: bump to version 0.8.2
  python-netaddr: bump to version 0.7.19
  python-pathvalidate: bump to version 0.14.0
  python-prompt-toolkit: bump to version 1.0.13
  python-psutil: bump to version 5.1.3
  python-pudb: bump to version 2017.1.1
  python-pyasn: bump to version 1.6.0b1
  python-pycli: bump to version 2.0.3
  python-pycparser: bump to version 2.17
  python-pydal: bump to version 17.1
  python-pygments: bump to version 2.2.0
  python-pymysql: bump to version 0.7.10
  python-pyparsing: bump to version 2.1.10
  python-pyro: bump to version 3.16
  python-pyroute2: bump to version 0.4.13
  python-pysmb: bump to version 1.1.19
  python-pysnmp: bump to version 4.3.3
  python-pysocks: bump to version 1.6.6
  python-pytrie: bump to version 0.3
  python-pyudev: bump to version 0.21.0
  python-requests: bump to version 2.13.0
  python-requests-toolbelt: bump to version 0.7.1
  python-rpi-gpio: bump to version 0.6.3
  python-setuptools-scm: bump to version 1.15.1rc1
  python-sh: bump to version 1.12.9
  python-simplejson: bump to version 3.10.0
  python-treq: bump to version 16.12.0
  python-twisted: bump to version 17.1.0
  python-urllib3: bump to version 1.20
  python-werkzeug: bump to version 0.11.15
  python-whoosh: bump to version 2.7.4
  python-xlsxwriter: bump to version 0.9.6
  python-xlwt: bump to version 1.2.0

 package/python-autobahn/python-autobahn.hash       |  4 +--
 package/python-autobahn/python-autobahn.mk         |  4 +--
 .../python-backports-abc/python-backports-abc.hash |  6 ++--
 .../python-backports-abc/python-backports-abc.mk   |  4 +--
 .../python-beautifulsoup4.hash                     |  4 +--
 .../python-beautifulsoup4/python-beautifulsoup4.mk |  4 +--
 package/python-certifi/python-certifi.hash         |  4 +--
 package/python-certifi/python-certifi.mk           |  4 +--
 package/python-cffi/python-cffi.hash               |  4 +--
 package/python-cffi/python-cffi.mk                 |  4 +--
 package/python-cherrypy/python-cherrypy.hash       |  6 ++--
 package/python-cherrypy/python-cherrypy.mk         |  4 +--
 package/python-click/python-click.hash             |  6 ++--
 package/python-click/python-click.mk               |  4 +--
 package/python-crossbar/python-crossbar.hash       |  6 ++--
 package/python-crossbar/python-crossbar.mk         |  4 +--
 .../python-cryptography/python-cryptography.hash   |  4 +--
 package/python-cryptography/python-cryptography.mk |  4 +--
 package/python-cssselect/python-cssselect.hash     |  7 ++---
 package/python-cssselect/python-cssselect.mk       |  4 +--
 package/python-docutils/python-docutils.hash       |  4 +--
 package/python-docutils/python-docutils.mk         |  4 +--
 package/python-enum/python-enum.hash               |  6 ++--
 package/python-enum/python-enum.mk                 |  4 +--
 package/python-enum34/python-enum34.hash           |  6 ++--
 package/python-enum34/python-enum34.mk             |  4 +--
 package/python-flask-login/python-flask-login.hash |  6 ++--
 package/python-flask-login/python-flask-login.mk   |  4 +--
 package/python-flup/python-flup.hash               |  7 ++---
 package/python-flup/python-flup.mk                 |  4 +--
 package/python-httplib2/python-httplib2.hash       |  6 ++--
 package/python-httplib2/python-httplib2.mk         |  4 +--
 package/python-idna/python-idna.hash               |  6 ++--
 package/python-idna/python-idna.mk                 |  4 +--
 package/python-ipaddress/python-ipaddress.hash     |  4 +--
 package/python-ipaddress/python-ipaddress.mk       |  4 +--
 package/python-ipython/python-ipython.hash         |  5 +--
 package/python-ipython/python-ipython.mk           |  4 +--
 package/python-jinja2/python-jinja2.hash           |  4 +--
 package/python-jinja2/python-jinja2.mk             |  4 +--
 package/python-jsonschema/python-jsonschema.hash   |  4 +--
 package/python-jsonschema/python-jsonschema.mk     |  4 +--
 package/python-mako/python-mako.hash               |  6 ++--
 package/python-mako/python-mako.mk                 |  4 +--
 package/python-markdown/python-markdown.hash       |  4 +--
 package/python-markdown/python-markdown.mk         |  4 +--
 .../python-mbstrdecoder/python-mbstrdecoder.hash   |  4 +--
 package/python-mbstrdecoder/python-mbstrdecoder.mk |  4 +--
 package/python-mutagen/python-mutagen.hash         |  6 ++--
 package/python-mutagen/python-mutagen.mk           |  4 +--
 .../0001-use-exec-in-py3-compatible-manner.patch   | 36 ----------------------
 package/python-mwclient/python-mwclient.hash       |  4 +--
 package/python-mwclient/python-mwclient.mk         |  4 +--
 package/python-netaddr/python-netaddr.hash         |  6 ++--
 package/python-netaddr/python-netaddr.mk           |  4 +--
 .../python-pathvalidate/python-pathvalidate.hash   |  4 +--
 package/python-pathvalidate/python-pathvalidate.mk |  4 +--
 .../python-prompt-toolkit.hash                     |  6 ++--
 .../python-prompt-toolkit/python-prompt-toolkit.mk |  4 +--
 package/python-psutil/python-psutil.hash           |  4 +--
 package/python-psutil/python-psutil.mk             |  4 +--
 package/python-pudb/python-pudb.hash               |  4 +--
 package/python-pudb/python-pudb.mk                 |  4 +--
 package/python-pyasn/python-pyasn.hash             |  6 ++--
 package/python-pyasn/python-pyasn.mk               |  6 ++--
 package/python-pycli/python-pycli.hash             |  7 ++---
 package/python-pycli/python-pycli.mk               |  4 +--
 package/python-pycparser/python-pycparser.hash     |  6 ++--
 package/python-pycparser/python-pycparser.mk       |  4 +--
 package/python-pydal/python-pydal.hash             |  4 +--
 package/python-pydal/python-pydal.mk               |  4 +--
 package/python-pygments/python-pygments.hash       |  4 +--
 package/python-pygments/python-pygments.mk         |  4 +--
 package/python-pymysql/python-pymysql.hash         |  4 +--
 package/python-pymysql/python-pymysql.mk           |  4 +--
 package/python-pyparsing/python-pyparsing.hash     |  4 +--
 package/python-pyparsing/python-pyparsing.mk       |  4 +--
 package/python-pyro/python-pyro.hash               |  5 +--
 package/python-pyro/python-pyro.mk                 |  4 +--
 package/python-pyroute2/python-pyroute2.hash       |  4 +--
 package/python-pyroute2/python-pyroute2.mk         |  4 +--
 package/python-pysmb/python-pysmb.hash             |  6 ++--
 package/python-pysmb/python-pysmb.mk               |  4 +--
 package/python-pysnmp/python-pysnmp.hash           |  4 +--
 package/python-pysnmp/python-pysnmp.mk             |  4 +--
 package/python-pysocks/python-pysocks.hash         |  6 ++--
 package/python-pysocks/python-pysocks.mk           |  4 +--
 package/python-pytrie/python-pytrie.hash           |  6 ++--
 package/python-pytrie/python-pytrie.mk             |  4 +--
 package/python-pyudev/python-pyudev.hash           |  6 ++--
 package/python-pyudev/python-pyudev.mk             |  4 +--
 .../python-requests-toolbelt.hash                  |  6 ++--
 .../python-requests-toolbelt.mk                    |  4 +--
 package/python-requests/python-requests.hash       |  4 +--
 package/python-requests/python-requests.mk         |  4 +--
 package/python-rpi-gpio/python-rpi-gpio.hash       |  6 ++--
 package/python-rpi-gpio/python-rpi-gpio.mk         |  4 +--
 .../python-setuptools-scm.hash                     |  4 +--
 .../python-setuptools-scm/python-setuptools-scm.mk |  4 +--
 package/python-sh/python-sh.hash                   |  4 +--
 package/python-sh/python-sh.mk                     |  4 +--
 package/python-simplejson/python-simplejson.hash   |  4 +--
 package/python-simplejson/python-simplejson.mk     |  4 +--
 package/python-treq/python-treq.hash               |  6 ++--
 package/python-treq/python-treq.mk                 |  4 +--
 package/python-twisted/python-twisted.hash         |  4 +--
 package/python-twisted/python-twisted.mk           |  4 +--
 package/python-urllib3/python-urllib3.hash         |  4 +--
 package/python-urllib3/python-urllib3.mk           |  4 +--
 package/python-werkzeug/python-werkzeug.hash       |  4 +--
 package/python-werkzeug/python-werkzeug.mk         |  4 +--
 package/python-whoosh/python-whoosh.hash           |  6 ++--
 package/python-whoosh/python-whoosh.mk             |  4 +--
 package/python-xlsxwriter/python-xlsxwriter.hash   |  4 +--
 package/python-xlsxwriter/python-xlsxwriter.mk     |  4 +--
 package/python-xlwt/python-xlwt.hash               |  7 ++---
 package/python-xlwt/python-xlwt.mk                 |  4 +--
 117 files changed, 262 insertions(+), 300 deletions(-)
 delete mode 100644 package/python-mwclient/0001-use-exec-in-py3-compatible-manner.patch

-- 
2.9.3
