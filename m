From: inblueswithu <inblueswithu@hotmail.com>
Date: Sun, 29 Jan 2012 17:12:57 +0530
Subject: [Buildroot] Image created is not booting,
 waiting for infinite time
In-Reply-To: <20120129103634.620aced8@skate>
References: <BLU0-SMTP88C894F00679EB12CEC0A3D28F0@phx.gbl>
 <20120128124931.5dddc20e@skate>
 <BLU0-SMTP296551C52410B48DE52F60D28C0@phx.gbl>
 <20120129103634.620aced8@skate>
Message-ID: <BLU0-SMTP3763BD6AB472CBE81E9839DD28C0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 29 January 2012 03:06 PM, Thomas Petazzoni wrote:
>
> Yes. The kernel headers version can be older than the kernel version
> running on the platform, since the kernel-to-userspace ABI is backward
> compatible.
The kernel headers version I used is 2.6.37.x. So my kernel on the 
target will be of that version.
But the kernel configuration is given as linux-3.1.config
So, my doubt is, will this new config file which indicates to be for 
kernel 3.1.x version
work fine with 2.6.37.x version of kernel?

Thanks & Regards
/inblueswithu/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120129/39dd10be/attachment.html>
