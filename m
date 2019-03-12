From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Mar 2019 23:21:52 +0100
Subject: [Buildroot] Adding custom linux config
In-Reply-To: <HE1PR0702MB361270F873CC0E92047A60CCCF490@HE1PR0702MB3612.eurprd07.prod.outlook.com>
References: <HE1PR0702MB361270F873CC0E92047A60CCCF490@HE1PR0702MB3612.eurprd07.prod.outlook.com>
Message-ID: <ae958dbb-99f6-ff67-aad9-cd24c45d925e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/03/2019 16:09, Devashish Bhageerutty wrote:
> Hi,
> 
> ?
> 
> I am building an image with an out of tree configuration. I have specified the
> path to my custom config file in the defconfig and my linux.config is in the
> folder structure as shown on the Buildroot template. But when I am building or
> if I do ?make linux-update-(def)config?, my config file is getting overwritten
> by a generic one. I have checked the /proc/configz on a running system to verify
> this. This configuration was working before on Buildroot 2015 with linux kernel
> 3.10 but now I am using Buildroot 2018.02 and kernel 4.14.73. I would be
> grateful if I could be pointed to what could be causing this or any tests I can
> make to figure out why this is happening.

 Can you do 'make savedefconfig' and share the resulting defconfig file? Your
explanation is not very clear I'm afraid...

 Regards,
 Arnout

> 
> ?
> 
> Best Regards,
> 
> ?
> 
> Deva
> 
> ?
> 
> windar_logo_email_sig
> 
> Devashish Bhageerutty
> 
> Embedded Software Engineer
> 
> Windar Photonics A/S
> 
> E-mail: db at windarphotonics.com <mailto:db@windarphotonics.com>
> 
> Web: www.windarphotonics.com
> 
> ?
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
