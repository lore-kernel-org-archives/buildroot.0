From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 23:33:34 +0200
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.67
In-Reply-To: <900065c9-8832-df20-35ac-ea69cbfe72e4@benettiengineering.com>
References: <20210612173513.2253959-1-giulio.benetti@benettiengineering.com>
 <20210720224443.24edcd0f@windsurf>
 <900065c9-8832-df20-35ac-ea69cbfe72e4@benettiengineering.com>
Message-ID: <20210720233334.2143daf9@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 20 Jul 2021 23:09:05 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Sure I can. Here there is a "problem" if we can call it that way. It's 
> from some month that they release very very fast. Now they are at NSS 
> 3.68 and NSPR 4.32 [1], but very soon there will be version 3.69. Even 
> if I send version bumps, they will release another version before you 
> apply for sure. Let's see if it gets slower.
> They also stopped emitting the Release Notes that doesn't help[2].
> 
> What can I do? Do I send the latest I see in the moment I bump and 
> that's it, right?

Correct. Whenever you see a new version, send a new patch series which
is based on the latest master, and mark your previous patches in
patchwork as "Superseded".

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
