From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 13 Jul 2017 12:45:05 -0500
Subject: [Buildroot] [PATCH 1/1] br toolchain: gcc5.4 bugfix
	libsanitizer powerpc
In-Reply-To: <20170713193316.28cc62eb@windsurf>
References: <1499918619-27858-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20170713040727.rfalp6j5n6dikbjd@tarshish>
 <CANQCQpa0fQDqAUsdPNLz_wKk4qu_YRkNB23hG5rOEedWpnpJ9A@mail.gmail.com>
 <20170713193316.28cc62eb@windsurf>
Message-ID: <CANQCQpY4MZdnLn=O4jqvDzqNToi_4R8dnQiGw0Re4-cTtr1dow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Thu, Jul 13, 2017 at 12:33 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Thu, 13 Jul 2017 08:29:32 -0500, Matthew Weber wrote:
>
>> > > +This applies only to gcc-5-branch, the code has been reworked for gcc 6.
>> >
>> > Your sign-off is missing.
>>
>>
>> I had assumed if I used the patch as is I would leave it without mods.
>> I can add the bug tracker url and my signed off.
>
> Please add your SoB and the bug tracker reference.
>
> Also, does this issue applies to gcc 4.9 as well ?
>

I'll check, we were using earlier versions of 5.4 and the bump broke
us.  I'll find the point it was introduced and add a comment.

Matt
