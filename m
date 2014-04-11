From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 12 Apr 2014 00:39:57 +0200
Subject: [Buildroot] [git commit] kmod: bump version
In-Reply-To: <20140412002150.0109b2fd@skate> (Thomas Petazzoni's message of
 "Sat, 12 Apr 2014 00:21:50 +0200")
References: <20140411185800.6052A9C6D0@busybox.osuosl.org>
 <20140412002150.0109b2fd@skate>
Message-ID: <87sipj32yq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Peter Korsgaard,
 > On Fri, 11 Apr 2014 20:57:27 +0200, Peter Korsgaard wrote:

 >> +ifeq ($(BR2_PACKAGE_PYTHON),y)
 >> +KMOD_DEPENDENCIES += python
 >> +KMOD_CONF_OPT += --enable-python
 >> +endif

 > What about Python 3 compatibility?

I wasn't sure, so I kept it safe for now. I'll do a test build to check.

-- 
Bye, Peter Korsgaard 
