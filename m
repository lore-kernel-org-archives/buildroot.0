From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Jan 2013 22:00:17 +0100
Subject: [Buildroot] [PATCH] graph-depends: add to exclusion list
In-Reply-To: <1357158963-3251-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Wed, 2 Jan 2013 21:36:03 +0100")
References: <201301022128.33543.yann.morin.1998@free.fr>
 <1357158963-3251-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87hamzpafy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> Add the root-password internal target to the exclusion list.
 Yann> Fixes failures like:
 Yann>     Getting dependencies for [... 'target-root-passwd' ...]
 Yann>     Error getting dependencies [... 'target-root-passwd' ...]

 Yann> Which is easily singled out with:
 Yann>     $ make target-root-passwd-show-depends
 Yann>     make[1]: *** No rule to make target `target-root-passwd-show-depends'.

Committed, thanks.

-- 
Bye, Peter Korsgaard
