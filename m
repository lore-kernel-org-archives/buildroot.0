From: Will Newton <will.newton@gmail.com>
Date: Thu, 3 Sep 2009 17:29:46 +0100
Subject: [Buildroot] [PATCH] buildroot: Remove old CVS relics.
In-Reply-To: <20090903161306.GC32465@mx.loc>
References: <87a5b0800909030904w38f82856pffd93068aa27ef93@mail.gmail.com>
	<20090903161306.GC32465@mx.loc>
Message-ID: <87a5b0800909030929o1e8c1cbeyb12e8373f1e62541@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 3, 2009 at 5:13 PM, Bernhard
Reutner-Fischer<rep.dot.nop@gmail.com> wrote:
> On Thu, Sep 03, 2009 at 05:04:57PM +0100, Will Newton wrote:
>>A few files seem to have been left over from the CVS days.
>>
>>Signed-off-by: Will Newton <will.newton@gmail.com>
>>---
>> package/gnuconfig/.cvsignore ? ? ? ? ? ? ? | ? ?5 -----
>> package/gnuconfig/CVS/Entries ? ? ? ? ? ? ?| ? 14 --------------
>> package/gnuconfig/CVS/Repository ? ? ? ? ? | ? ?1 -
>> package/gnuconfig/CVS/Root ? ? ? ? ? ? ? ? | ? ?1 -
>> package/gnuconfig/testsuite/.cvsignore ? ? | ? ?1 -
>> package/gnuconfig/testsuite/CVS/Entries ? ?| ? ?7 -------
>> package/gnuconfig/testsuite/CVS/Repository | ? ?1 -
>> package/gnuconfig/testsuite/CVS/Root ? ? ? | ? ?1 -
>> toolchain/elf2flt/elf2flt/.cvsignore ? ? ? | ? ?3 ---
>> toolchain/elf2flt/elf2flt/CVS/Entries ? ? ?| ? 17 -----------------
>> toolchain/elf2flt/elf2flt/CVS/Repository ? | ? ?1 -
>> toolchain/elf2flt/elf2flt/CVS/Root ? ? ? ? | ? ?1 -
>> 12 files changed, 0 insertions(+), 53 deletions(-)
>
> No. Look at them. They are maintained elsewhere and we need that to
> update them.

gnuconfig is maintained in git is it not? A "cvs up" in that directory
results in conflicts and a version of gnuconfig from 2008.

elf2flt also gets conflicts but at least the CVS server appears to be live.
