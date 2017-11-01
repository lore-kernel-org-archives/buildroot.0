From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 1 Nov 2017 08:24:54 -0500
Subject: [Buildroot] Analysis of build results for 2017-10-30
In-Reply-To: <20171101104532.43dcd164@windsurf>
References: <20171031070013.AD75D207B2@mail.free-electrons.com>
 <20171031230519.3feb2619@windsurf>
 <CANQCQpYxR6nParzHgEswkZyh8K2-DUHnTu5VsOtyJOksd3rU5w@mail.gmail.com>
 <20171101104532.43dcd164@windsurf>
Message-ID: <CANQCQpbp4Eu7V=FMj_azMoR22w=QScoVL69ToHKhYkU-_FLFbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Nov 1, 2017 at 4:45 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue, 31 Oct 2017 21:37:28 -0500, Matthew Weber wrote:
>

<snip>

>> >>          arc |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/9567703c95823be10400c0a330c3997a4cd6a62c | ORPH
>> >>          arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/e3ee47e30a01e68a80fcbef3178f8eb051fe509f | ORPH
>> >>          sh4 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/7d60ebf31fd9df7a5fef7e7723859c32d7972f5b | ORPH
>> >
>> > The libfdt/python issue. Matt Weber has proposed a patch to fix it:
>> > https://patchwork.ozlabs.org/patch/827287/, however I have some
>> > questions/concerns about it.
>>
>> Should we just wait for the November uboot release that resolves the
>> underlying design issue upstream?
>
> No, because we want to fix this problem before the next Buildroot
> release in November.
>

I'll work on pulling in this patchset from upstream.  It looks like it
was reviewed but missed the merge window for 2017.11.
https://lists.denx.de/pipermail/u-boot/2017-October/309560.html

Matt
