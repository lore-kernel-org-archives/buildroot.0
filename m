From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Dec 2013 12:17:29 +0100
Subject: [Buildroot] [PATCH] cubieboard: mkcubiecard: use the right
	command for checking user privilege
In-Reply-To: <1385991967-10126-1-git-send-email-andi@etezian.org> (Andi
 Shyti's message of "Mon, 2 Dec 2013 14:46:07 +0100")
References: <1385991967-10126-1-git-send-email-andi@etezian.org>
Message-ID: <87haaqnpyu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andi" == Andi Shyti <andi@etezian.org> writes:

 > On some shell environments the EUID variable, which checks the
 > user id, is not defined. Use `id -u` instead.

 > This patch mutes the following error:

 > ./board/cubietech/cubieboard/mkcubiecard.sh: 31: [: -ne: unexpected operator

Committed, thanks.

-- 
Bye, Peter Korsgaard
