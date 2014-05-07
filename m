From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 May 2014 14:00:20 +0200
Subject: [Buildroot] [PATCH 06/11] python-setuptools: add license
	information
In-Reply-To: <1399390966-9678-7-git-send-email-rjbarnet@rockwellcollins.com>
 (Ryan Barnett's message of "Tue, 6 May 2014 10:42:41 -0500")
References: <1399390966-9678-1-git-send-email-rjbarnet@rockwellcollins.com>
 <1399390966-9678-7-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <87r445er3f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Barnett <rjbarnet@rockwellcollins.com> writes:

 > Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
 > ---
 >  package/python-setuptools/python-setuptools.mk |    2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
 > index 48bf7c5..6ede292 100644
 > --- a/package/python-setuptools/python-setuptools.mk
 > +++ b/package/python-setuptools/python-setuptools.mk
 > @@ -7,6 +7,8 @@
 >  PYTHON_SETUPTOOLS_VERSION = 2.1.2
 >  PYTHON_SETUPTOOLS_SOURCE  = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
 >  PYTHON_SETUPTOOLS_SITE    = http://pypi.python.org/packages/source/s/setuptools
 > +PYTHON_SETUPTOOLS_LICENSE = Python Software Foundation License
 > +PYTHON_SETUPTOOLS_LICENSE += or Zope Public License

I prefer to keep it on a single line for easy grepping, and we should
imho use PKG-INFO as license file.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
