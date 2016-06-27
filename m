From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jun 2016 22:00:16 +0200
Subject: [Buildroot] [PATCH] glibc: bump default to version 2.23
In-Reply-To: <576B180F.70309@zacarias.com.ar> (Gustavo Zacarias's message of
 "Wed, 22 Jun 2016 19:58:23 -0300")
References: <1466590187-21862-1-git-send-email-gustavo@zacarias.com.ar>
 <87r3bpwa02.fsf@dell.be.48ers.dk>
 <42d8119e5e64c7a67018770b3f029146@zacarias.com.ar>
 <20160622171317.79fbea7e@free-electrons.com>
 <312f3b85fab01ed234da9ff79ac982d0@zacarias.com.ar>
 <877fdhw8ek.fsf@dell.be.48ers.dk>
 <57d9d2a6-9bcc-c512-4e09-6eb8f8958c76@mind.be>
 <576B180F.70309@zacarias.com.ar>
Message-ID: <87y45qpflb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 > Hi.
 > My $.02: Ubuntu 16.04 LTS is on 2.23.
 > In general we haven't seen big regressions with glibc upgrades
 > compared to binutils/gcc.

Ok, good.

 > Also, and don't take this as cockyness, i'm like the only one (except
 > for Bernd one time) putting out security patches for glibc.
 > Currently my spare time is pretty thin, and backporting patches for
 > two versions of glibc and testing them is much more work than a single
 > version.
 > If we default to n-1 this means carrying on more patches since
 > generally n-1 has more vulnerabilities than n when talking about
 > glibc.

Yes, you do send a lot of package updates (security related or not) -
Thanks for that, much appreciated.

 > If in consequence i only post patches for n and we default to n-1,
 > well, that sucks plain and simple, since we would be shipping
 > known-vulnerable by default, and how many users will bother to switch
 > to latest glibc?
 > Regards.

Ok, I'm convinced - Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
