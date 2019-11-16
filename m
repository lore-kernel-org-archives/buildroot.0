From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 Nov 2019 23:46:08 +0100
Subject: [Buildroot] [next] package/python-txdbus: bump to 1.1.1
In-Reply-To: <20191116132930.21821-1-matthew.weber@rockwellcollins.com> (Matt
 Weber's message of "Sat, 16 Nov 2019 07:29:30 -0600")
References: <20191116132930.21821-1-matthew.weber@rockwellcollins.com>
Message-ID: <87h833tp73.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 > ---
 >  package/python-txdbus/python-txdbus.hash | 4 ++--
 >  package/python-txdbus/python-txdbus.mk   | 4 ++--
 >  2 files changed, 4 insertions(+), 4 deletions(-)

 > diff --git a/package/python-txdbus/python-txdbus.hash b/package/python-txdbus/python-txdbus.hash
 > index 38760fada6..60740e29d2 100644
 > --- a/package/python-txdbus/python-txdbus.hash
 > +++ b/package/python-txdbus/python-txdbus.hash
 > @@ -1,3 +1,3 @@
 >  # md5, sha256 from https://pypi.org/pypi/txdbus/json
 > -md5	f17c9204c7f56365c297ba68e6840900  txdbus-1.1.0.tar.gz
 > -sha256	6ff57f42c58d935956024b3c6824c1019db7d233d0af86aa0573b73b63b0817c  txdbus-1.1.0.tar.gz
 > +sha256	eefcffa4efbf82ba11222f17f5989fe1b2b6ef57226ef896c4a7084c990ba217  txdbus-1.1.1.tar.gz
 > +md5	ce8a0e0a17cdbada725e3159802ae75f  txdbus-1.1.1.tar.gz
 > diff --git a/package/python-txdbus/python-txdbus.mk b/package/python-txdbus/python-txdbus.mk
 > index 08429baac8..d8e7a7bee9 100644
 > --- a/package/python-txdbus/python-txdbus.mk
 > +++ b/package/python-txdbus/python-txdbus.mk
 > @@ -4,9 +4,9 @@
 >  #
 >  ################################################################################
 
 > -PYTHON_TXDBUS_VERSION = 1.1.0
 > +PYTHON_TXDBUS_VERSION = 1.1.1

So this is not a bugfix release that should be part of 2019.11?

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
