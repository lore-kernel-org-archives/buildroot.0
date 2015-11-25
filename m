From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Nov 2015 22:48:09 +0100
Subject: [Buildroot] [PATCH] package/autossh: do not look for the host's
	ssh command
In-Reply-To: <1448487898-25214-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Wed, 25 Nov 2015 22:44:58 +0100")
References: <1448487898-25214-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87ziy1ycme.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > autossh looks for 'ssh' in the PATH, which may not exist on a build
 > machine.

 > Fixes a private autobuild failure (soon to go public).

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <jacmet@uclibc.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
