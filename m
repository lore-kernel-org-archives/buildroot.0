From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Oct 2019 23:48:21 +0200
Subject: [Buildroot] [RFC PATCH v2 10/30] package/compiler-rt: new
 package
In-Reply-To: <CANQCQpb=YZNK3a8fHUczUcJReiiJjDrO=Q6tY3w6fS_XOxbsMg@mail.gmail.com>
References: <20191017152929.49153-1-michael.drake@codethink.co.uk>
 <20191017152929.49153-11-michael.drake@codethink.co.uk>
 <CANQCQpb=YZNK3a8fHUczUcJReiiJjDrO=Q6tY3w6fS_XOxbsMg@mail.gmail.com>
Message-ID: <dbe45821-d2e5-ae60-0302-daddd043c8d1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Matt,

On 17/10/2019 21:17, Matthew Weber wrote:
> On Thu, Oct 17, 2019 at 10:30 AM Michael Drake
> <michael.drake@codethink.co.uk> wrote:
>> From: Matt Weber <matthew.weber@rockwellcollins.com>
>>
>> This patch adds support for the compiler-rt (CLANG runtime) library.
>> It builds a set of static libraries and installs them into the
>> CLANG/LLVM toolchain resource folder.
>>
> FYI, I plan to publish (soon) a cleaned up version of my original
> series which add the compiler-rt feature.  That refreshed patchset
> would have the feedback from my last series that's missing here.

 There are probably interactions with Romain's clang series and Joseph's LLD
series, so it would be nice if all of that could be combined in one series or at
least ordered somewhat...

 Regards,
 Arnout
