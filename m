From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 26 Oct 2011 10:05:55 -0300
Subject: [Buildroot] Some topics for the Buildroot Developer Day
In-Reply-To: <4EA801B8.7000502@visionsystems.de>
References: <20111024173815.2277c6dd@skate> <4EA801B8.7000502@visionsystems.de>
Message-ID: <4ff558d1b2a462f239c4c83ef48b6680@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26.10.2011 09:48, Yegor Yefremov wrote:

> was such an issue as firmware support already discussed? There is
> such a repo
> http://git.kernel.org/?p=linux/kernel/git/dwmw2/linux-firmware.git
> containing firmware for a broad set of devices. If we could make an
> infrastructure for this repo it would be very easy to use it projects
> without a need to manually copy those files. What do you think about
> it?
>
> Yegor

There used to be release/snapshot tarballs in kernel.org before the 
debacle.
My $.02 is that we could just do it as a package with a huge option 
list for each firmware file(s) required for different drivers/devices.
I'd go for a smaller subset to begin with since there are firmware 
files for SAN controllers and other big iron stuff that probably are't 
the target for buildroot.
Regards.
