From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 21 May 2015 14:13:27 +0200
Subject: [Buildroot] [PATCH 08/13] gpu-viv-bin-mx6q: rename package to
	imx-gpu-viv
In-Reply-To: <20150521113445.40004616@free-electrons.com>
References: <1432116744-25760-1-git-send-email-gary.bisson@boundarydevices.com>
 <1432116744-25760-9-git-send-email-gary.bisson@boundarydevices.com>
 <20150521113445.40004616@free-electrons.com>
Message-ID: <CAAMH-ytPNSOLskwCvf=EDqdFjWhSCp=JgexG1a_gB4+8DQS+hg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Thu, May 21, 2015 at 11:34 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Gary Bisson,
>
> On Wed, 20 May 2015 12:12:19 +0200, Gary Bisson wrote:
>> In order to be in line with new Freescale naming convention:
>>
>> https://github.com/Freescale/meta-fsl-arm/commit/74c86aa9
>>
>> "Graphics recipe is renamed from gpu-viv-bin-mx6q to imx-gpu-viv"
>>
>> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
>
> You need to add Config.in.legacy handling when renaming a package.

Oops, didn't know about that file actually. I got a patch ready but I
might wait a couple of days for other remarks before sending my v2.

Thanks,
Gary
