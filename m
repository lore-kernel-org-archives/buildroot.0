From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 01 May 2014 22:18:45 +0200
Subject: [Buildroot] [PATCH v2] target-finalize: avoid stripping kernel
	modules with incorrect permissions
In-Reply-To: <86b494c37c1419136d1e.1398886142@argentina> (Thomas De
 Schampheleire's message of "Wed, 30 Apr 2014 21:29:02 +0200")
References: <86b494c37c1419136d1e.1398886142@argentina>
Message-ID: <87ha59s15m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > If a kernel module is installed with incorrect permissions (0755 iso 0644),
 > it would get stripped in a way that would render the kernel module broken.
 > While the incorrect permissions are a developer error, it is a minor change
 > to prevent this mistake from causing incorrectly stripped modules.

 > This was reported with bug #6992:
 > https://bugs.busybox.net/show_bug.cgi?id=6992

 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

 > ---
 > v2: add comment with more detail (Arnout)

Committed, thanks.

-- 
Bye, Peter Korsgaard
