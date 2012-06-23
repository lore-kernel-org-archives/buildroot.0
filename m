From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 23 Jun 2012 21:53:42 +0200
Subject: [Buildroot] [PATCH] xinetd: expand DESTDIR patch to fix
	uninstall target
In-Reply-To: <1340067704-7095-1-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Mon, 18 Jun 2012 21:01:44 -0400")
References: <1340067704-7095-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <87bok9dcu1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 Danomi> Expand the openWRT patch to fix xinetd's "uninstall" target,
 Danomi> so that buildroot's "xinetd-clean" removes the correct files.

Committed, thanks.

-- 
Bye, Peter Korsgaard
