From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Dec 2018 23:19:53 +0100
Subject: [Buildroot] [git commit] python-requests: bump to version 2.20.0
In-Reply-To: <20181020123842.E007D8105D@busybox.osuosl.org> (Peter Korsgaard's
 message of "Sat, 20 Oct 2018 14:39:01 +0200")
References: <20181020123842.E007D8105D@busybox.osuosl.org>
Message-ID: <87k1k73ieu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=42bebd1e7ce07608967c36e2877f578f4c143e5c
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > LICENSE update: replaced http address with https.

 > Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.08.x after adjusting the commit message
to mention that this is a security bump (CVE-2018-18074), thanks.

> ---
 >  package/python-requests/python-requests.hash | 6 +++---
 >  package/python-requests/python-requests.mk   | 4 ++--
 >  2 files changed, 5 insertions(+), 5 deletions(-)

 > diff --git a/package/python-requests/python-requests.hash b/package/python-requests/python-requests.hash
 > index b71fe86ee7..3aa8e1359f 100644
 > --- a/package/python-requests/python-requests.hash
 > +++ b/package/python-requests/python-requests.hash
 > @@ -1,5 +1,5 @@
 >  # md5, sha256 from https://pypi.org/pypi/requests/json
 > -md5	6c1a31afec9d614e2e71a91ee6ca2878  requests-2.19.1.tar.gz
 > -sha256	ec22d826a36ed72a7358ff3fe56cbd4ba69dd7a6718ffd450ff0e9df7a47ce6a  requests-2.19.1.tar.gz
 > +md5	cf034ab571854453719594120366f467  requests-2.20.0.tar.gz
 > +sha256	99dcfdaaeb17caf6e526f32b6a7b780461512ab3f1d992187801694cba42770c  requests-2.20.0.tar.gz
 >  # Locally computed sha256 checksums
 > -sha256	82a869fe4e967449956d26a546adc762acace028852ce81ba16c3c5b1d76b15b  LICENSE
 > +sha256	be41abac2c40f8530307e8d172c590b476f4a488bc6a68f8de57b7cf64786687  LICENSE
 > diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
 > index 881d196526..358835d816 100644
 > --- a/package/python-requests/python-requests.mk
 > +++ b/package/python-requests/python-requests.mk
 > @@ -4,9 +4,9 @@
 >  #
 >  ################################################################################
 
 > -PYTHON_REQUESTS_VERSION = 2.19.1
 > +PYTHON_REQUESTS_VERSION = 2.20.0
 >  PYTHON_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
 > -PYTHON_REQUESTS_SITE =
 > https://files.pythonhosted.org/packages/54/1f/782a5734931ddf2e1494e4cd615a51ff98e1879cbe9eecbdfeaf09aa75e9
 > +PYTHON_REQUESTS_SITE =
 > https://files.pythonhosted.org/packages/97/10/92d25b93e9c266c94b76a5548f020f3f1dd0eb40649cb1993532c0af8f4c
 >  PYTHON_REQUESTS_SETUP_TYPE = setuptools
 >  PYTHON_REQUESTS_LICENSE = Apache-2.0
 >  PYTHON_REQUESTS_LICENSE_FILES = LICENSE
 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
