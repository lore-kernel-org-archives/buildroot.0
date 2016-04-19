From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 19 Apr 2016 10:12:51 +0200
Subject: [Buildroot] [PATCH] gst1-imx: make kernel dependency optional
In-Reply-To: <20160418212343.3b7ff726@free-electrons.com>
References: <97bf649b600a5548cfd3c53575747a057f24e07e.1460973919.git.baruch@tkos.co.il>
 <CAAMH-ysFMBA9bDK4h2KQv-HBmjMYmqzdZX1YhBwKzr-7VXz8zw@mail.gmail.com>
 <20160418212343.3b7ff726@free-electrons.com>
Message-ID: <CAAMH-ytcam=_YTJjn+suKuQABxJWJwPMDUMeTH5LQy7RKHokyw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Mon, Apr 18, 2016 at 9:23 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon, 18 Apr 2016 12:18:28 +0200, Gary Bisson wrote:
>
>> That is true, it isn't a hard dependency, the reason I left it like
>> that is because if the headers aren't found and none of the other
>> configurations (plugins-bad, imx-gpu-viv or libimxvpuapi) are set, no
>> actual plugin will be built which could be confusing.
>>
>> Although this patch is correct and legit, I'd rather go ahead and
>> rework the entire package since Carlos worked on being able to
>> select/disable each and individual plugin since version 0.12.1:
>> https://github.com/Freescale/meta-fsl-arm/commit/cec4c47e
>
> But isn't Baruch patch as-is already a step in the right direction?
> I.e, should we merge it as-is, or wait for the entire rework to be done?

Yes it is going in the right direction. Thinking about it now, yes it
might make sense to merge it as-is since we don't know when the full
rework will be done.

Regards,
Gary
