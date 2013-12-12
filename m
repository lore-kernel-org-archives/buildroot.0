From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 13 Dec 2013 00:01:57 +0100
Subject: [Buildroot] [pull request v4] Pull request for branch
	yem/host-packages
In-Reply-To: <cover.1386872011.git.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Thu, 12 Dec 2013 19:18:39 +0100")
References: <cover.1386872011.git.yann.morin.1998@free.fr>
Message-ID: <87y53pzna2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Hello All!

 > This series adds parted as a host package.
 > This will allow (eg.) post-image scripts to use parted.

 > Changes v3 -> v4:
 >   - fix double double-slash in parted's ./configure options

 > Changes v2 -> v3:  (Jerzy)
 >   - Fix bad copy-paste in commit log

 > Changes v1 -> v2:  (Thomas)
 >   - don't depend on host-lvm2
 >   - so don't add host-lvm2
 >   - relax dependencies on lvm2/readline for target package
 >   - fix typoes in commit log

Committed series, thanks.

-- 
Bye, Peter Korsgaard
