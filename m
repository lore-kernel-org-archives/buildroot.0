From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 18 Jan 2016 09:48:23 +0100
Subject: [Buildroot] [PATCH] imx-kobs: fix build for recent toolchains
In-Reply-To: <20160117195831.GF10304@tarshish>
References: <1453060408-12544-1-git-send-email-gary.bisson@boundarydevices.com>
 <20160117195831.GF10304@tarshish>
Message-ID: <CAAMH-yvACuXV3kOwEO0Viv6Too_QHqGoFgz62Y8O9-FFMWK3_w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On Sun, Jan 17, 2016 at 8:58 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Gary,
>
> On Sun, Jan 17, 2016 at 08:53:28PM +0100, Gary Bisson wrote:
>> Starting with Linux 4.4 headers, mtd-user.h isn't including stdint.h any
>> more which breaks the build.
>>
>> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
>> ---
>> Hi all,
>>
>> This patch fixes the following error:
>> http://autobuild.buildroot.net/results/05a/05a159c7f8382237d4c941b1bb6de7dad72708f3/
>
> This text should be part of the commit log message above.

Ok, wasn't sure actually. Should I submit a V2 or can the submitter
includes it in the commit log for this time?

Regards,
Gary
