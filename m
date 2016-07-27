From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 27 Jul 2016 06:44:18 -0500
Subject: [Buildroot] [PATCH] fmc and fmlib: bump version to fsl-sdk-v2.0
In-Reply-To: <20160727095259.38202964@free-electrons.com>
References: <1469564436-5079-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20160727095259.38202964@free-electrons.com>
Message-ID: <CANQCQpayvnChiJih7x6bGoCwk-uNi_Sv+x4Qauz4r1vDaX7zaw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wednesday, July 27, 2016, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue, 26 Jul 2016 15:20:36 -0500, Matt Weber wrote:
>> From: Ronak Desai <ronak.desai@rockwellcollins.com>
>>
>> Signed-off-by: Ronak Desai <ronak.desai@rockwellcollins.com>
>> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
>
> Thanks for this patch. However, unless the two package bumps are
> inter-related (i.e they cannot be made independently from each other),
> we prefer to have one patch for each bump.

They are but I could separate them into two patches in a single patch set.

>
> Also, while you're at it, could you add a hash file to these packages?

Sure.

> The Buildroot method for generating tarballs from Git repositories now
> guarantees that the tarballs are reproducible, so we can add hash files
> as well.
>
> Thanks,

Thank you!

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>

-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure
Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted Third
Party Intellectual Property (TPIP) content must be encrypted and sent to
matthew.weber at corp.rockwellcollins.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160727/08232942/attachment.html>
