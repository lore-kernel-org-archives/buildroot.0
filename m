From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Oct 2016 20:09:19 +0200
Subject: [Buildroot] [PATCH v3 2/3] binutils: get rid of host-texinfo
	dependency and other documentation tricks
In-Reply-To: <1476187354-13966-2-git-send-email-patrickdepinguin@gmail.com>
 (Thomas De Schampheleire's message of "Tue, 11 Oct 2016 14:02:33
 +0200")
References: <1476187354-13966-1-git-send-email-patrickdepinguin@gmail.com>
 <1476187354-13966-2-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <87bmymzttc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
 > The binutils/host-binutils package applied several tricks to avoid building
 > info documentation. In the worst case, host-texinfo is added as dependency.

 > However, there is a simpler solution that removes the need for all these
 > tricks: instruct the makefiles to use a dummy makeinfo command ('true').

 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
