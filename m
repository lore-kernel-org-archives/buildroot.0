From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Mar 2015 14:16:28 +0100
Subject: [Buildroot] [PATCH] fs/common: build host-xz when xz
	compression is used
In-Reply-To: <1425893653-9577-1-git-send-email-patrickdepinguin@gmail.com>
 (Thomas De Schampheleire's message of "Mon, 9 Mar 2015 10:34:13
 +0100")
References: <1425893653-9577-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <87r3syqpjn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
 > When a filesystem image is xz-compressed, the XZ variable is used to refer
 > to the xz compression tool, but it is not necessarily available. Add a
 > proper dependency to fix that.

Isn't that already handled by support/dependencies/check-host-xzcat.mk?

-- 
Bye, Peter Korsgaard
