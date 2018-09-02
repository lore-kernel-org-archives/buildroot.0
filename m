From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Sep 2018 10:07:15 +0200
Subject: [Buildroot] [PATCH/next 3/3] linux-headers: drop old
 unsupported 4.x versions
In-Reply-To: <pkc75fx6k1.ln2@ID-313208.user.individual.net> (Bernd Kuhls's
 message of "Sat, 25 Aug 2018 09:21:29 +0200")
References: <20180824184133.8508-1-bernd.kuhls@t-online.de>
 <20180824184133.8508-3-bernd.kuhls@t-online.de>
 <20180824230233.7a7e0a24@windsurf>
 <pkc75fx6k1.ln2@ID-313208.user.individual.net>
Message-ID: <87pnxw491o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Am Fri, 24 Aug 2018 23:02:33 +0200 schrieb Thomas Petazzoni:
 >> I think it makes more sense to automatically select some *older* kernel
 >> headers. Indeed, if the user was using 4.10 kernel headers, presumably
 >> he is using some 4.10/4.11/4.12 kernel, so if we upgrade the kernel
 >> headers to 4.14... the new build may not work at runtime, the kernel
 >> headers being more recent than the running kernel.

 > Hi Thomas,

 > when preparing this patch I searched for previous removals of kernel 
 > versions for orientation on how to handle the legacy options and found 
 > this patch/commit by Peter where he upgraded the versions:

 > https://git.buildroot.net/buildroot/commit/?
 > id=2a9b7b8a1ec0f200c6b82641512325284dee9a54

Hmm, that was a mistake. I must have missed that we still had an entry
for 3.2.

-- 
Bye, Peter Korsgaard
