From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 17:09:47 +0200
Subject: [Buildroot] [PATCH] package/zsh: remove busybox show others
 dependency
In-Reply-To: <20180331105530.30668-1-romain.naour@smile.fr> (Romain Naour's
 message of "Sat, 31 Mar 2018 12:55:30 +0200")
References: <20180331105530.30668-1-romain.naour@smile.fr>
Message-ID: <87a7uouvr8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > Back in 2013, zsh was added to Buildroot [1] with the dependency on
 > BR2_PACKAGE_BUSYBOX_SHOW_OTHERS. This dependency was keept with the
 > refactoring [2].
 > But Busybox doesn't provide a zsh shell in the firt place.
 > This dependency can be removed.

 > [1] 3d19b7ef598f3534b46cf0746a81bc437579127c
 > [2] 1dbd7b991025a8bf39ab5d25c2fd97f47f084bac

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > Cc: Phil Eichinger <phil.eichinger@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
