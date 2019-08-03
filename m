From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Aug 2019 16:22:54 +0200
Subject: [Buildroot] [PATCH] package/python-pyparsing: bump to version
 2.4.2
In-Reply-To: <1564824929-8529-1-git-send-email-pjtexier@koncepto.io>
 (Pierre-Jean Texier's message of "Sat, 3 Aug 2019 11:35:29 +0200")
References: <1564824929-8529-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <875znecoqp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pierre-Jean" == Pierre-Jean Texier <pjtexier@koncepto.io> writes:

 > Also add a hash for LICENSE file
 > Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>

Committed, thanks.

> ---
 >  package/python-pyparsing/python-pyparsing.hash | 6 ++++--
 >  package/python-pyparsing/python-pyparsing.mk   | 4 ++--
 >  2 files changed, 6 insertions(+), 4 deletions(-)

 > diff --git a/package/python-pyparsing/python-pyparsing.hash b/package/python-pyparsing/python-pyparsing.hash
 > index 6138580..d1161e4 100644
 > --- a/package/python-pyparsing/python-pyparsing.hash
 > +++ b/package/python-pyparsing/python-pyparsing.hash
 > @@ -1,3 +1,5 @@
 >  # md5 from https://pypi.python.org/pypi/pyparsing/json, sha256 locally computed
 > -md5 065908b92904e0d3634eb156f44cc80e pyparsing-2.1.10.tar.gz
 > -sha256 811c3e7b0031021137fc83e051795025fcb98674d07eb8fe922ba4de53d39188 pyparsing-2.1.10.tar.gz
 > +md5 46d02cbe0461fe0571d51649e6006ef5 pyparsing-2.4.2.tar.gz
 > +sha256 6f98a7b9397e206d78cc01df10131398f1c8b8510a2f4d97d9abd82e1aacdd80 pyparsing-2.4.2.tar.gz
 > +# Locally computed sha256 checksums
 > +sha256	10d5120a16805804ffda8b688c220bfb4e8f39741b57320604d455a309e01972  LICENSE
 > diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
 > index 4a4b1bb..f419e00 100644
 > --- a/package/python-pyparsing/python-pyparsing.mk
 > +++ b/package/python-pyparsing/python-pyparsing.mk
 > @@ -4,9 +4,9 @@
 >  #
 >  ################################################################################
 
 > -PYTHON_PYPARSING_VERSION = 2.1.10
 > +PYTHON_PYPARSING_VERSION = 2.4.2
 >  PYTHON_PYPARSING_SOURCE = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
 > -PYTHON_PYPARSING_SITE = https://pypi.python.org/packages/38/bb/bf325351dd8ab6eb3c3b7c07c3978f38b2103e2ab48d59726916907cd6fb
 > +PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/7e/24/eaa8d7003aee23eda270099eeec754d7bf4399f75c6a011ef948304f66a2
 >  PYTHON_PYPARSING_LICENSE = MIT
 >  PYTHON_PYPARSING_LICENSE_FILES = LICENSE
 >  PYTHON_PYPARSING_SETUP_TYPE = setuptools
 > -- 
 > 2.7.4

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
