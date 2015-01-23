From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Jan 2015 21:17:54 +0100
Subject: [Buildroot] [PATCH] python-pysendfile: new package
In-Reply-To: <1421786335-3067-1-git-send-email-yegorslists@googlemail.com>
 (Yegor Yefremov's message of "Tue, 20 Jan 2015 21:38:55 +0100")
References: <1421786335-3067-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <877fwd6ykt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 > ---
 >  package/Config.in                                |  1 +
 >  package/python-pysendfile/Config.in              |  6 ++++++
 >  package/python-pysendfile/python-pysendfile.hash |  3 +++
 >  package/python-pysendfile/python-pysendfile.mk   | 13 +++++++++++++
 >  4 files changed, 23 insertions(+)
 >  create mode 100644 package/python-pysendfile/Config.in
 >  create mode 100644 package/python-pysendfile/python-pysendfile.hash
 >  create mode 100644 package/python-pysendfile/python-pysendfile.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index 266de13..32d6755 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -540,6 +540,7 @@ menu "external python modules"
 >  	source "package/python-pyparsing/Config.in"
 >  	source "package/python-pypcap/Config.in"
 >  	source "package/python-pyro/Config.in"
 > +	source "package/python-pysendfile/Config.in"
 >  	source "package/python-pysnmp/Config.in"
 >  	source "package/python-pysnmp-apps/Config.in"
 >  	source "package/python-pysnmp-mibs/Config.in"
 > diff --git a/package/python-pysendfile/Config.in b/package/python-pysendfile/Config.in
 > new file mode 100644
 > index 0000000..5a919dd
 > --- /dev/null
 > +++ b/package/python-pysendfile/Config.in
 > @@ -0,0 +1,6 @@
 > +config BR2_PACKAGE_PYTHON_PYSENDFILE
 > +	bool "python-pysendfile"
 > +	help
 > +	  A Python interface to sendfile(2) syscall
 > +
 > +	  https://github.com/giampaolo/pysendfile
 > diff --git a/package/python-pysendfile/python-pysendfile.hash b/package/python-pysendfile/python-pysendfile.hash
 > new file mode 100644
 > index 0000000..3cedb3f
 > --- /dev/null
 > +++ b/package/python-pysendfile/python-pysendfile.hash
 > @@ -0,0 +1,3 @@
 > +# Locally computed:
 > +sha256  f4ca8a7f0be67e3d710c0633dd9aadab6881203c31cb9eb9be4f10361ad3f937  python-pysendfile-2.0.1.tar.gz
 > +

Extra newline here, otherwise it looks good.

Committed, thanks.

-- 
Bye, Peter Korsgaard
