From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Dec 2012 23:16:44 +0100
Subject: [Buildroot] [PATCH] imx-lib: new package
In-Reply-To: <1905374549.1044823.1355782331560.JavaMail.root@advansee.com>
References: <1355752131-31966-1-git-send-email-arnout@mind.be>
 <50CF5987.90805@mind.be> <87mwxc76je.fsf@dell.be.48ers.dk>
 <50CF9647.3020506@mind.be>
 <1905374549.1044823.1355782331560.JavaMail.root@advansee.com>
Message-ID: <50CF99CC.8040603@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/12/12 23:12, Beno?t Th?baudeau wrote:
> On Monday, December 17, 2012 11:01:43 PM, Arnout Vandecappelle wrote:
>> On 17/12/12 21:44, Peter Korsgaard wrote:
>>> Is the gst-fsl-plugins stuff still needed now that the coda driver
>>> is in
>>> mainline?
>>
>>    Mainline v3.7 only has support for mx27 and mx51.
>
> Even for mx27 and mx51, are you sure that the mainline implementation for CODA
> is compatible with Freescale's imx-lib? I highly doubt it.

  Peter's point is that with coda you don't need all that proprietary 
stuff, it's just a media framework device.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
