From: =?UTF-8?Q?Bartosz_Bi=c5=82as?= <b.bilas@grinn-global.com>
Date: Mon, 17 Jun 2019 18:56:07 +0200
Subject: [Buildroot] [RFC PATCH 1/4] configs/bananapro_defconfig: bump
 Linux to 5.1.1
In-Reply-To: <20190526212621.52c5c474@windsurf>
References: <20190520193223.14071-1-b.bilas@grinn-global.com>
 <20190526212621.52c5c474@windsurf>
Message-ID: <7cb22cbd-91dd-9b2d-d245-5090f5b6f895@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 26.05.2019 21:26, Thomas Petazzoni wrote:
> Hello,
>
> On Mon, 20 May 2019 21:32:20 +0200
> Bartosz Bilas <b.bilas@grinn-global.com> wrote:
>
>> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
>> ---
>>   configs/bananapro_defconfig | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
> Why did you split your changes into four patches ? As I understand it,
> the current bananapro_defconfig already supports WiFi,
Yes, that's right.
>   so if the bump
> to Linux 5.1.1 breaks WiFi and requires the fixes of the three other
> patches, then you should have a single patch that does all.
>
> Without this, you break bisectability: if I apply only your PATCH 1/4,
> then the WiFi feature which was working is no longer working.
Ah, I haven't thought about that in that way, I'll keep it in my mind ;)
>
> Of course, if WiFi was in fact not working with the current defconfig
> (i.e before any of your patches), then it's fine to split the patches.
> Just perhaps patches 2, 3 and 4 could be the same, because it's all
> about making WiFi work.
Ok, thanks for the hints.
>
> Could you clarify this point, and send a new iteration ?
I've fixed that and I'm going to send a new one soon.
>
> Thanks,
>
> Thomas

Best

Bartek
