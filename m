From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 Oct 2014 16:33:17 +0200
Subject: [Buildroot] [PATCH v2] kmod: add patches to support build on
	RHEL 5
In-Reply-To: <763624c4511eae62667b.1412689352@localhost> (Thomas De
 Schampheleire's message of "Tue, 07 Oct 2014 15:42:32 +0200")
References: <763624c4511eae62667b.1412689352@localhost>
Message-ID: <87k34cgdaq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > kmod uses certain features not available on older RHEL 5 machines (RedHat
 > Enterprise Linux). This commit adds two patches to fix that.

 > Both patches have been proposed upstream, the second one being accepted, the
 > first rejected with the suggestion to add the patch in Buildroot instead.

 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
