From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 22 Feb 2014 21:57:46 +0100
Subject: [Buildroot] [PATCH v2] distcc: deprecate package,
	only useful for development
In-Reply-To: <1393102023-4049-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 22 Feb 2014 21:47:03 +0100")
References: <1393102023-4049-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ha7qsw51.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Since quite a while, we have deprecated, and then removed the support
 > to build a compiler on the target. Therefore, having a distcc package
 > for the package is quite useless, and this patch consequently marks it
 > as deprecated so it can be removed in a future version of Buildroot.

 > Fixes:

 >   http://autobuild.buildroot.net/results/16b/16be2138c8e5ba785fa2ad55b478dcd1b6fb5123/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---

Committed this one instead, thanks.

 > Changes v1 -> v2:

 >  * Use BR2_DEPRECATED_SINCE_2014_02 instead of BR2_DEPRECATED. Thanks
 >    to Ryan Barnett for anticipating Thomas DS potential reaction to my
 >    mistake :-)

;)

-- 
Bye, Peter Korsgaard
