From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Aug 2016 23:25:34 +0200
Subject: [Buildroot] [PATCH] libaio: allow building on static-only
	configurations
In-Reply-To: <1472501917-28520-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 29 Aug 2016 22:18:37 +0200")
References: <1472501917-28520-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <874m63469d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit adds a simple patch to the libaio build system that allows
 > it to be used on static-only configurations. It is probably easier to
 > fix this than to propagate the !BR2_STATIC_LIBS dependency.

 > Fixes:

 >   http://autobuild.buildroot.net/results/8c86402bd14a0af1b82e6e07c06531a856dd37c6/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks. Don't forget to send the patch upstream.

-- 
Bye, Peter Korsgaard
