From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 25 Feb 2014 21:30:57 +0100
Subject: [Buildroot] [PATCH v2 1/2] packages: improve dependency check
	in virtual packages.
In-Reply-To: <1393343137-4209-2-git-send-email-eric.le.bihan.dev@free.fr>
 (Eric Le Bihan's message of "Tue, 25 Feb 2014 16:45:36 +0100")
References: <1393343137-4209-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1393343137-4209-2-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <87ha7nhr3y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric Le Bihan <eric.le.bihan.dev@free.fr> writes:

 > The current version of dependency check for virtual package <foo>
 > defines FOO_CONFIGURE_CMDS to print an error message if the
 > dependencies are not met.

 > This patch updates all the virtual packages to use the GNU Make control
 > function $(error text...) instead.

 > This makes the error happen at the beginning of the build, with a clearer
 > message.

 > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
