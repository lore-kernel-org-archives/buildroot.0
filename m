From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 14 Feb 2012 11:03:21 +0100
Subject: [Buildroot] [git commit] python: workaround distutils issue
 with binary extensions
In-Reply-To: <20120214095225.A3DBC90A9D@busybox.osuosl.org>
References: <20120214095225.A3DBC90A9D@busybox.osuosl.org>
Message-ID: <4F3A3169.9080109@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 14.02.2012 10:32, schrieb Peter Korsgaard:
> commit: http://git.buildroot.net/buildroot/commit/?id=40281284ad5ab41fea4058d57c130cbae0fb9d70
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> distutils adds -L$LIBDIR (/usr/lib), breaking build of binary extensions.
> Seen with netifaces, but other extensions may be affected as well.

I hope this talk will change the situation in the future: https://us.pycon.org/2012/schedule/presentation/11/.

I've tried to raise this issue in distutils mailing list, but no one answered: http://python.6.n6.nabble.com/RFC-real-cross-compiling-support-for-Distutils2-td4368968.html

Peter, have you tried to make the following python patches upstream?

python-2.7-100-optional-test-modules.patch
python-2.7-101-optional-pydoc.patch
python-2.7-102-optional-2to3.patch
python-2.7-103-optional-sqlite.patch
python-2.7-104-optional-tk.patch
python-2.7-105-optional-curses.patch
python-2.7-106-optional-expat.patch
python-2.7-107-optional-codecs-cjk.patch
python-2.7-108-optional-nis.patch
python-2.7-109-optional-unicodedata.patch
python-2.7-110-optional-db.patch
python-2.7-111-optional-ssl.patch
python-2.7-112-optional-bzip2.patch
python-2.7-113-optional-zlib.patch

Yegor
