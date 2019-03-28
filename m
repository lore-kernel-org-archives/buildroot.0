From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Mar 2019 17:30:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/liburcu: bump version to 0.10.2
In-Reply-To: <CADYdroNt7C4Mbm3+vyMLZHbd01aBCtEmmihrcU0-Lm13NYHxXw@mail.gmail.com>
 (Norbert Lange's message of "Thu, 28 Mar 2019 16:23:52 +0100")
References: <20190325215102.20059-1-nolange79@gmail.com>
 <87pnqbmitt.fsf@dell.be.48ers.dk>
 <CADYdroNt7C4Mbm3+vyMLZHbd01aBCtEmmihrcU0-Lm13NYHxXw@mail.gmail.com>
Message-ID: <87imw3kllm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Norbert" == Norbert Lange <nolange79@gmail.com> writes:

Hi,

 >> Should this be applied to 2019.02.x as well?

 > Its a new version, I dont know what versioning scheme you follow,
 > but that's more than a a small bugfix to me?

 > Practically if you use lttng-ust your application could block for a
 > while. The fix is in 0.10.1
 > aswell as in 0.9.5, see
 > https://github.com/urcu/userspace-rcu/commit/64478021edcf7a5ac3bca3fa9e8b8108d2fbb9b6

Ok, so bumping to 0.9.5 is probably the best solution for 2019.02.x
(from 0.9.2).

As you presumably use liburcu, could you send a patch for 2019.02.x to
bump to 0.9.5?

-- 
Bye, Peter Korsgaard
