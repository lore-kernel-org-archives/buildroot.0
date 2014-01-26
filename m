From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 26 Jan 2014 22:03:36 +0100
Subject: [Buildroot] [PATCH 1/1] openpowerlink: force static library
	build
In-Reply-To: <1390599261-30736-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Fri, 24 Jan 2014 22:34:21 +0100")
References: <1390599261-30736-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <87bnyy1mmv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > There is no shared lib in openpowerlink,
 > so force static lib to build libpowerlink.a

 > Fixes:
 > http://autobuild.buildroot.net/results/b33/b33008d260c95bedc52bed48f191f76843612ef9/build-end.log
 > http://autobuild.buildroot.net/results/c46/c464bdfb8edaaf69d49ade92ef9cc6f45cc73362/build-end.log

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
