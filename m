From: Nigel Sollars <nsollars@gmail.com>
Date: Sun, 29 Apr 2012 10:47:16 -0400
Subject: [Buildroot] Buildroot fails to build when selecting build
	packages
In-Reply-To: <4F9D53B5.50705@mind.be>
References: <CAG6aBkV4xjdsXcvq-AssYQ1nOw0XiBiEjTZvi2rowStdfSCJNg@mail.gmail.com>
 <201204291144.26712.arnout@mind.be>
 <CAG6aBkVmLoN-fHkGWUiOfjRM7k2swUvzNQ38p=schi+Y2Ug1hg@mail.gmail.com>
 <4F9D4BED.4050001@mind.be>
 <CAG6aBkVUgOkv5kvPZkY+YgysDQ274FdaW+0vtVU-Vk1rBudJZA@mail.gmail.com>
 <4F9D53B5.50705@mind.be>
Message-ID: <CAG6aBkVL0pXYVJNsk7D4OONWM6-B6Uj7aD364j8nW-mH_5ijJA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Yes this one is set by the distro / profile.d scripts here is the OUTPUT,
the distro I am using is slackware 13.37

PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/lib/pkgconfig

Nige


On Sun, Apr 29, 2012 at 10:44 AM, Arnout Vandecappelle <arnout@mind.be>wrote:

> On 04/29/12 16:36, Nigel Sollars wrote:
>
>> ok the command you gave shows that the configuration is reading from my
>> /usr/lib/pkgconfig/dbus-1.pc file.
>>
>> So thats obviously the cause to this one.
>>
>
>  Do you have PKG_CONFIG_PATH or something similar set in the environment?
> (env | grep PKG_CONFIG)
>
>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                               arnout at mind be
> Senior Embedded Software Architect                 +32-16-286540
> Essensium/Mind                                     http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR
> Leuven
> LinkedIn profile: http://www.linkedin.com/in/**arnoutvandecappelle<http://www.linkedin.com/in/arnoutvandecappelle>
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>



-- 
?Science is a differential equation. Religion is a boundary condition.?

Alan Turing
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120429/156bc1a8/attachment.html>
