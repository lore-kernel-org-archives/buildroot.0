From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 19 Nov 2014 15:54:57 +0100
Subject: [Buildroot] Python backport packages
Message-ID: <CAGm1_ksb30m_J2bPFTrgfrmJK_PwOH0HZVUcm2fX6RQSm-1DJA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

python-tornado 4x needs
https://pypi.python.org/pypi/backports.ssl_match_hostname
It looks like there is some kind of infrastructure for backport
packages: https://pypi.python.org/pypi/backports/1.0

aside from ssl_match_hostname, there is also
https://pypi.python.org/pypi/backports.lzma

Should I just add "ssl_match_hostname" as is or should I make extra
folder in package/Config.in, as we have for core and external
packages?

Yegor
