From: Martin Banky <Martin.Banky@gmail.com>
Date: Mon, 12 Aug 2013 17:14:37 -0700
Subject: [Buildroot] [Bug 6404] New: Buildroot's coreutils 'uname -p'
 reports 'Unknown' on recent ARM kernels
In-Reply-To: <5209466E.9030305@mind.be>
References: <bug-6404-163@https.bugs.busybox.net/> <5209466E.9030305@mind.be>
Message-ID: <CAANb1FjeQzEL39+P9ztOxYHHN=L=DYsBVjwAMiduWH_8j+6ZqQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a very long running problem that goes back to at least 2005. Google
coreutils uname patch, to see the history of this problem. Uname will
porbably need a different patch to work on ARM kernels.

Regards,
Martin


On Mon, Aug 12, 2013 at 1:32 PM, Arnout Vandecappelle <arnout@mind.be>wrote:

> On 01/08/13 06:30, bugzilla at busybox.net wrote:
>
>> Buildroot's coreutils uname(1) command has a special patch applied as
>> part of
>> buildroot.  When you run 'uname -p', it tries to print out extended
>> information
>> about the processor you are running.  It does this by parsing
>> /proc/cpuinfo.
>> I'm not sure of the provenance of this enhancement, but you can read the
>> code
>> in package/coreutils/coreutils-**uname.patch.
>>
>
>  Seems to me that this patch should be dropped since it's a feature patch.
> Martin, you added it and Gustavo acked it in 2010. OK to drop it?
>
>  Regards,
>  Arnout
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/**arnoutvandecappelle<http://www.linkedin.com/in/arnoutvandecappelle>
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130812/fb9aff5d/attachment.html>
