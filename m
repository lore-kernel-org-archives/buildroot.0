From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 15 Aug 2014 10:18:29 +0200
Subject: [Buildroot] [PATCH] bluez5_utils: gatttool depends on
	bluez5_utils client
In-Reply-To: <1408040914-23320-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 14 Aug 2014 20:28:34 +0200")
References: <1408040914-23320-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87a976414a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The gatttool utility uses readline, and is therefore built only if
 > --enable-client is used, i.e when bluez5_utils client applications are
 > enabled. Therefore, this commit makes
 > BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL depend on
 > BR2_PACKAGE_BLUEZ5_UTILS_CLIENT. It also moves
 > BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL to be right below the
 > BR2_PACKAGE_BLUEZ5_UTILS_CLIENT definition.

 > Fixes:

 >   http://autobuild.buildroot.org/results/f2b/f2b8b1bf5d50e6223a9a6d6858320975edb2a25a/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
