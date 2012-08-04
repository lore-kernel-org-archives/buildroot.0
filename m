From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 4 Aug 2012 14:53:28 +0200
Subject: [Buildroot] Package informations, online and updated
In-Reply-To: <20120804143047.149fbf6c@skate>
References: <20120731213729.49c4b3ee@skate>
 <CAHXCMMLSAQ__EMtn=uSr3P1B3fAfbVCJTo-N5jK780cL6gQh_w@mail.gmail.com>
 <20120804143047.149fbf6c@skate>
Message-ID: <CAHXCMM+wipC3PvGyav=VyWVrKg5WrQvw-Ztjo+qDZaXbAE3QQg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/8/4 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Le Sat, 4 Aug 2012 14:04:49 +0200,
> Samuel Martin <s.martin49@gmail.com> a ?crit :
>
>> Another idea, half way with autobuild, could be the latest
>> build-success and build-failure dates (maybe for each toolchain
>> running in autobuild).
>
> Well, for what configurations? A per-toolchain date wouldn't make
> sense: every build builds a different, random, set of packages. So
> toolchain A with package B, C, D may build, but not toolchain A with
> package C, D, E.
You're right.
In such a case, it would be good to know that packages B, C, D has
successfully been built at that time; package E will cause a
build-failure, so, will trigger the "alarm" (aka, email/bug tracker
entry/...) :).

My point is that sometimes, making some cleanup, some packages do not build.
So, it would be useful to know if it has been built recently (so, in
such a case the problem may be a dirty-worktree or the host
configuration), or if there is a deeper problem due to the upgrade of
some other packages, change in the infrastructure or anything else.

Cheers.

-- 
Sam
