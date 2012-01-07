From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 07 Jan 2012 20:36:04 +0100
Subject: [Buildroot] genext2fs: couldn't allocate a block (no free space)
In-Reply-To: <CAOrAeonTZC0dXZnNLLfTjrcZHyiTGHRUWcKDO06mz3MOT0Y7CQ@mail.gmail.com>
 (vbr vbr's message of "Fri, 6 Jan 2012 10:39:42 -0800")
References: <CAOrAeonTZC0dXZnNLLfTjrcZHyiTGHRUWcKDO06mz3MOT0Y7CQ@mail.gmail.com>
Message-ID: <87zkdzgva3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "vbr" == vbr vbr <vvvg77@gmail.com> writes:

 vbr> Hi,
 vbr> I am using buildroot 2011.11 with x86_64 and hitting this issue after enabling
 vbr> valgrind which made my target fatter:
 vbr> genext2fs: couldn't allocate a block (no free space)

 vbr> I made this change to work around this issue increasing the number
 vbr> of BLOCKS, but it's probably not the right thing to do:

40% is probably a bit extreme. Out of interest, how many blocks did it
estimate before, and how many did you need?

-- 
Bye, Peter Korsgaard
