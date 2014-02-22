From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 22 Feb 2014 21:19:08 +0100
Subject: [Buildroot] [PATCH 1/1] sdl: run autogen.sh as PRE_CONFIGURE
	step
In-Reply-To: <5308ED29.8050201@openwide.fr> (Romain Naour's message of "Sat,
 22 Feb 2014 19:32:09 +0100")
References: <1393063090-831-1-git-send-email-romain.naour@openwide.fr>
 <20140222181220.134dc547@skate> <5308ED29.8050201@openwide.fr>
Message-ID: <87fvnauchv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 >> A similar change was made (but for a different reason) in the next
 >> branch, in commit
 >> http://git.buildroot.net/buildroot/commit/package/sdl?h=next&id=f75b5de9f6f473a257c607e97419a2338d57333c.
 >> 
 >> Peter, we should backport this patch into the master branch, I believe.
 >> 
 >> Thomas
 > Ha ok, I didn't see it.
 > Indeed, we need it in master branch.

Ok, I've cherry picked that commit for master, thanks.

-- 
Bye, Peter Korsgaard
