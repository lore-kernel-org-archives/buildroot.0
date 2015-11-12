From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 12 Nov 2015 18:22:37 -0300
Subject: [Buildroot] [PATCH 2/2] configs/qemu: bump to the latest linux
 version
In-Reply-To: <20151112211421.GB21428@waldemar-brodkorb.de>
References: <1447151972-12086-1-git-send-email-gustavo@zacarias.com.ar>
 <1447151972-12086-2-git-send-email-gustavo@zacarias.com.ar>
 <20151112211421.GB21428@waldemar-brodkorb.de>
Message-ID: <5645031D.5060405@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/11/15 18:14, Waldemar Brodkorb wrote:

>> x86: stick to 4.2.x kernels since 4.3 doesn't work right with uclibc
>> (any variant) based toolchains.
>
> Can you elaborate on this?
> A quick build test worked fine for me.
> Or did you had any runtime issues?

Hi Waldemar.
Just try to pull a dhcp address from the network interface.
Regards.
