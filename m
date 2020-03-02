From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Mar 2020 23:31:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-multidict: bump to
 version 4.7.5
In-Reply-To: <20200302094333.13100-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Mon, 2 Mar 2020 02:43:33 -0700")
References: <20200302094333.13100-1-james.hilliard1@gmail.com>
Message-ID: <874kv6e6dj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

It would have been good to explain why this should be applied to master
and not next.

Committed after extending the commit message with the info from the
CHANGES file:

https://github.com/aio-libs/multidict/commit/64d13b5443fca1cd13d0ea6d0f7637eaa4f2c5d7

 > ---
 >  package/python-multidict/python-multidict.hash | 6 +++---
 >  package/python-multidict/python-multidict.mk   | 4 ++--
 >  2 files changed, 5 insertions(+), 5 deletions(-)

 > diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
 > index 02e1c1ef51..431a94247a 100644
 > --- a/package/python-multidict/python-multidict.hash
 > +++ b/package/python-multidict/python-multidict.hash
 > @@ -1,5 +1,5 @@
 >  # md5, sha256 from https://pypi.org/pypi/multidict/json
 > -md5	22b46f759cf2cc3ca1d2c9f82cc9bb79  multidict-4.7.4.tar.gz
 > -sha256	d7d428488c67b09b26928950a395e41cc72bb9c3d5abfe9f0521940ee4f796d4  multidict-4.7.4.tar.gz
 > +md5  9a1ed2cc0cd3e5dd2e71921104f2b760  multidict-4.7.5.tar.gz
 > +sha256  aee283c49601fa4c13adc64c09c978838a7e812f85377ae130a24d7198c0331e  multidict-4.7.5.tar.gz
 >  # Locally computed sha256 checksums
 > -sha256	a1c5825513279d3085a0ba46880e148ea3710c149bbaedcf2d11605a5ed3c4ad  LICENSE
 > +sha256  a1c5825513279d3085a0ba46880e148ea3710c149bbaedcf2d11605a5ed3c4ad  LICENSE
 > diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
 > index 10aa556aa1..2f80b1f851 100644
 > --- a/package/python-multidict/python-multidict.mk
 > +++ b/package/python-multidict/python-multidict.mk
 > @@ -4,9 +4,9 @@
 >  #
 >  ################################################################################
 
 > -PYTHON_MULTIDICT_VERSION = 4.7.4
 > +PYTHON_MULTIDICT_VERSION = 4.7.5
 >  PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
 > -PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/b6/22/ae21cedaa0e6d35e84e8ab57700dcf3d4609421ebe113e1aaafc468eec42
 > +PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/61/b4/475114b3f1671da634f89239e61038f8742d9ac13aa34b32a05bf8022d22
 >  PYTHON_MULTIDICT_SETUP_TYPE = setuptools
 >  PYTHON_MULTIDICT_LICENSE = Apache-2.0
 >  PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
 > -- 
 > 2.20.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
