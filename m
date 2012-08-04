From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Aug 2012 14:30:47 +0200
Subject: [Buildroot] Package informations, online and updated
In-Reply-To: <CAHXCMMLSAQ__EMtn=uSr3P1B3fAfbVCJTo-N5jK780cL6gQh_w@mail.gmail.com>
References: <20120731213729.49c4b3ee@skate>
 <CAHXCMMLSAQ__EMtn=uSr3P1B3fAfbVCJTo-N5jK780cL6gQh_w@mail.gmail.com>
Message-ID: <20120804143047.149fbf6c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 4 Aug 2012 14:04:49 +0200,
Samuel Martin <s.martin49@gmail.com> a ?crit :

> Another idea, half way with autobuild, could be the latest
> build-success and build-failure dates (maybe for each toolchain
> running in autobuild).

Well, for what configurations? A per-toolchain date wouldn't make
sense: every build builds a different, random, set of packages. So
toolchain A with package B, C, D may build, but not toolchain A with
package C, D, E.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
