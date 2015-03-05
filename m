From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 05 Mar 2015 01:14:29 +0100
Subject: [Buildroot] [git commit] rpi-firmware: remove no longer used
 BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
In-Reply-To: <20150304230537.78290b41@free-electrons.com>
References: <20150304202748.6C184817F9@busybox.osuosl.org>	<54F78019.7020603@mind.be>
 <20150304230537.78290b41@free-electrons.com>
Message-ID: <54F79FE5.6030308@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/03/15 23:05, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Wed, 04 Mar 2015 22:58:49 +0100, Arnout Vandecappelle wrote:
>
> >> -config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
> >
> >  Is there no legacy handling needed?
>
> I thought about this, but my reasoning is that since the package now
> installs the DTBs unconditionally, the behavior is now the same as
> having this option =y, and therefore there is no need for legacy
> handling.

 Yep makes sense.

 Regards,
 Arnout

>
> Did I miss something?
>
> Thomas
>


-- 
Arnout Vandecappelle arnout at mind be
Senior Embedded Software Architect +32-16-286500
Essensium/Mind http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint: 7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
