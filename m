From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Tue, 16 May 2017 08:59:22 +0200
Subject: [Buildroot] [PATCH] x11r7: xf86-input-tslib: upgrade to 1.0.0
In-Reply-To: <7b39e63f-791f-2999-8fc2-e2e7c0df7ffc@posteo.de>
References: <20170514075026.13434-1-martink@posteo.de>
 <20170514143733.5fa069e9@free-electrons.com>
 <7b39e63f-791f-2999-8fc2-e2e7c0df7ffc@posteo.de>
Message-ID: <d63bddd1-163e-d34e-6d3e-284d4c0efcb1@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 2017-05-15 08:28, Martin Kepplinger wrote:
> Am 2017-05-14 um 14:37 schrieb Thomas Petazzoni:
>> Hello,
>>
>> On Sun, 14 May 2017 09:50:26 +0200, Martin Kepplinger wrote:
>>> As the update from 0.0.X to 1.0.0 suggests, this is a major update. The driver
>>> uses X11's touch API now, instead of motion with button emulation. Furthermore
>>> it supports multitouch when a recent version of tslib is installed.
>>>
>>> It is not backwards compatible for very old versions of the X server. See
>>> https://github.com/merge/xf86-input-tslib/releases for some details.
>>
>> What do you call "very old versions of the X server" ?
>>
>> Buildroot still supports the X server in version 1.14.7. Does this
>> qualify as a "very old version" ?
>>
> 
> While, to be honest I'm still digging for the definitive answer here,
> I'm pretty sure 1.12 is the minimum X.org xserver version supported for
> 1.0.0 here.
> 
> 1.14 and up is supported.

yes. 1.12 it is. So 1.11 is "very old" :)

thanks
                      martin
