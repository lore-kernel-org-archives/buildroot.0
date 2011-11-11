From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 11 Nov 2011 20:14:55 +0100
Subject: [Buildroot] [PATCH 1 of 3 resend] linux: add
	linux-update-config and linux-update-defconfig targets
In-Reply-To: <2841f845388b464fc8a9.1318604216@localhost6.localdomain6> (Thomas
 De Schampheleire's message of "Fri, 14 Oct 2011 16:56:56 +0200")
References: <patchbomb.1318604215@localhost6.localdomain6>
 <2841f845388b464fc8a9.1318604216@localhost6.localdomain6>
Message-ID: <87vcqq1nf4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 Thomas> In analogy to build targets uclibc-update and busybox-update, add
 Thomas> extra targets to copy the current configuration to the custom
 Thomas> configuration file set in buildroot. These targets facilitate the
 Thomas> work of developers adding support for a specific board.

 Thomas> linux-update-config copies .config directly.
 Thomas> linux-update-defconfig first creates a defconfig and copies that.

Committed, thanks.

-- 
Bye, Peter Korsgaard
