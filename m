From: =?UTF-8?Q?=C5=81ukasz_Przenios=C5=82o?= <bremenpl@gmail.com>
Date: Thu, 20 Dec 2018 10:14:41 +0100
Subject: [Buildroot] Cross compiling kernel module for the target
In-Reply-To: <20181220100733.5c6d0860@windsurf>
References: <CA+OsCCTCqQ+Fne+=VtXKgi5E_ezkdTAva-zTk6KaWa9egem0Sg@mail.gmail.com>
 <20181220090411.7ab00f70@windsurf>
 <CA+OsCCQ2TWYiEv-a8uRaJVSd4YX9A4T_EV1ihC1Y2ZyrNPAkag@mail.gmail.com>
 <20181220100733.5c6d0860@windsurf>
Message-ID: <CA+OsCCRWydtsa1RVjGhc8ZdV-guMuA1ORauct4XH8ZYjgk6zvw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, sorry for the Cc, its there now.
No, my module is supposed to be a completely separate thing for now. I
intend to build it using cross compilation tools provided by build root
after the image is loaded to the target. I want to load the module using
insmod. Then after the module is stable, I could add it to the buildroot
config.

czw., 20 gru 2018 o 10:07 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
napisa?(a):

> Hello,
>
> Please keep the mailing list in Cc when replying. Thanks!
>
> On Thu, 20 Dec 2018 09:55:41 +0100, ?ukasz Przenios?o wrote:
> > Hello Thomas, thank you for answer.
> > Yes, I know it should point to the build dir, but the problem is, I dont
> > have that directory and I dont know how to "place" is there. On my host I
> > have seen that this build dir is a soft link to the linux headers folder,
> > thus, thought this is the way around it. Could you please give me a hint
> on
> > what I am missing in the buildroot config maybe?
>
> Are you building a Linux kernel image as part of your Buildroot
> configuration ?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181220/bb43b13f/attachment.html>
