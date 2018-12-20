From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Dec 2018 10:07:33 +0100
Subject: [Buildroot] Cross compiling kernel module for the target
In-Reply-To: <CA+OsCCQ2TWYiEv-a8uRaJVSd4YX9A4T_EV1ihC1Y2ZyrNPAkag@mail.gmail.com>
References: <CA+OsCCTCqQ+Fne+=VtXKgi5E_ezkdTAva-zTk6KaWa9egem0Sg@mail.gmail.com>
 <20181220090411.7ab00f70@windsurf>
 <CA+OsCCQ2TWYiEv-a8uRaJVSd4YX9A4T_EV1ihC1Y2ZyrNPAkag@mail.gmail.com>
Message-ID: <20181220100733.5c6d0860@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please keep the mailing list in Cc when replying. Thanks!

On Thu, 20 Dec 2018 09:55:41 +0100, ?ukasz Przenios?o wrote:
> Hello Thomas, thank you for answer.
> Yes, I know it should point to the build dir, but the problem is, I dont
> have that directory and I dont know how to "place" is there. On my host I
> have seen that this build dir is a soft link to the linux headers folder,
> thus, thought this is the way around it. Could you please give me a hint on
> what I am missing in the buildroot config maybe?

Are you building a Linux kernel image as part of your Buildroot
configuration ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
