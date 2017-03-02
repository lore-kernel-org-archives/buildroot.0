From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 22:08:18 +0100
Subject: [Buildroot] [PATCH 00/58] python pypi library mass version bump.
In-Reply-To: <20170219191255.1503-1-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
Message-ID: <20170302220818.29ceb548@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Feb 2017 14:11:57 -0500, Adam Duskett wrote:

>   python-autobahn: bump to version 0.17.1

As suggested by Yegor, I did not apply this patch.

>   python-backports-abc: bump to version 0.5
>   python-beautifulsoup4: bump to version 4.5.3
>   python-certifi: bump to version 2017.1.23
>   python-cffi: bump to version 1.9.1
>   python-cherrypy: bump to version 10.1.1
>   python-click: bump to version 6.7

All these applied.

>   python-crossbar: bump to version 16.10.1

As suggested by Yegor, I also didn't apply this one.

>   python-cryptography: bump to version 1.7.2
>   python-cssselect: bump to version 1.0.1
>   python-docutils: bump to version 0.13.1
>   python-enum: bump to version 0.4.6
>   python-enum34: bump to version 1.1.6
>   python-flask-login: bump to version 0.4.0
>   python-flup: bump to version 1.0.3.dev20161029
>   python-httplib2: bump to version 0.10.3
>   python-idna: bump to version 2.2
>   python-ipaddress: bump to version 1.0.18
>   python-ipython: bump to version 5.2.2
>   python-jinja2: bump to version 2.9.5
>   python-jsonschema: bump to version 2.6.0
>   python-mako: bump to version 1.0.6
>   python-markdown: bump to version 2.6.8
>   python-mbstrdecoder: bump to version 0.2.2
>   python-mutagen: bump to version 1.36.2
>   python-mwclient: bump to version 0.8.2
>   python-netaddr: bump to version 0.7.19
>   python-pathvalidate: bump to version 0.14.0
>   python-prompt-toolkit: bump to version 1.0.13
>   python-psutil: bump to version 5.1.3
>   python-pudb: bump to version 2017.1.1
>   python-pyasn: bump to version 1.6.0b1
>   python-pycli: bump to version 2.0.3
>   python-pycparser: bump to version 2.17
>   python-pydal: bump to version 17.1
>   python-pygments: bump to version 2.2.0
>   python-pymysql: bump to version 0.7.10
>   python-pyparsing: bump to version 2.1.10
>   python-pyro: bump to version 3.16
>   python-pyroute2: bump to version 0.4.13
>   python-pysmb: bump to version 1.1.19
>   python-pysnmp: bump to version 4.3.3
>   python-pysocks: bump to version 1.6.6
>   python-pytrie: bump to version 0.3

All these applied.

>   python-pyudev: bump to version 0.21.0

The patch that exists on this package does not apply after the bump:

Applying 0001-Workaround-finding-libudev-on-systems-without-ldconf.patch using patch: 
can't find file to patch at input line 22
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:

so I skipped this patch.

>   python-requests: bump to version 2.13.0
>   python-requests-toolbelt: bump to version 0.7.1
>   python-rpi-gpio: bump to version 0.6.3
>   python-setuptools-scm: bump to version 1.15.1rc1
>   python-sh: bump to version 1.12.9
>   python-simplejson: bump to version 3.10.0
>   python-treq: bump to version 16.12.0
>   python-twisted: bump to version 17.1.0
>   python-urllib3: bump to version 1.20
>   python-werkzeug: bump to version 0.11.15
>   python-whoosh: bump to version 2.7.4
>   python-xlsxwriter: bump to version 0.9.6
>   python-xlwt: bump to version 1.2.0

All these applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
