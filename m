From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Dec 2019 19:37:56 +0100
Subject: [Buildroot] [PATCH] package/pkg-generic.mk: make
 HOST_<pkg>_DL_OPTS inherit from <pkg>_DL_OPTS
In-Reply-To: <20191128185552.236602-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 28 Nov 2019 19:55:52 +0100")
References: <20191128185552.236602-1-thomas.petazzoni@bootlin.com>
Message-ID: <87immufwjf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Just like _SITE, _SOURCE, _SITE_METHOD, it is very likely that if
 > <pkg>_DL_OPTS is defined, the same value should be used for
 > HOST_<pkg>_DL_OPTS, so let's have the same inheritance logic than the
 > one we have for other variables.

 > Fixes:

 >   https://bugs.busybox.net/show_bug.cgi?id=12321

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
