From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jul 2012 08:47:08 -0300
Subject: [Buildroot] [PATCH 0/2] qemu mips64 sample config
In-Reply-To: <20120726085327.34b7add7@skate>
References: <1343251453-6462-1-git-send-email-gustavo@zacarias.com.ar>
 <20120726085327.34b7add7@skate>
Message-ID: <50112E3C.70201@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/26/12 03:53, Thomas Petazzoni wrote:

> Do you mind if I ask this information to the readme.txt file, so that
> the documentation doesn't pretend that it works perfectly if it
> doesn't?
> 
> Also, with which Qemu version did you try? Did you try with the latest
> Git? I was told that some mips64 fixes were merged recently in Qemu.
> 
> Thanks!
> 
> Thomas

I wouldn't mind of course, no need to ask.
With 1.1.1 as i said, i can't get the latest git qemu to build at the
moment (some undefined references to pit_*).
We should probably do our own host-qemu as you said once, it would
enable us to get a precise target with, if needed, necessary patches to
fix some particular scenarios.
Unfortunately i'm terribly busy on weekdays, maybe i can look into it
during the weekend.
Regards.
