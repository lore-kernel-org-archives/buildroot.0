From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Sat, 7 May 2016 21:27:15 +0200
Subject: [Buildroot] Kernel panic with glibc
In-Reply-To: <20160507142800.6fec8574@free-electrons.com>
References: <572DBAB9.3060607@gmail.com> <572DD6A2.8030406@gmail.com>
 <20160507141147.65fe012a@free-electrons.com> <572DDCA5.8060204@gmail.com>
 <20160507142800.6fec8574@free-electrons.com>
Message-ID: <572E4193.9070604@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 07/05/2016 14:28, Thomas Petazzoni ha scritto:

> Once you have changed those configuration options and removed your
> local Buildroot modifications, please try again a complete build "make
> clean all" and see if it works or not. If it doesn't, I'll try to
> reproduce here.


I'm very sorry, the building was successful, but it still doesn't boot 
due to the kernel panic. I attach again the .config.

Please, would you help me to fix this? I don't know how to go ahead with 
my work. I need glibc mainly to support bluez5:

http://permalink.gmane.org/gmane.comp.lib.uclibc.buildroot/137079

I also found this old message:

https://patchwork.ozlabs.org/patch/208855/

do you think I can enable wordexp also in the latest release?
In the meanwhile I'm going to try to use bluez 5.27 which should not 
have the dependency of regexp as you written.

I haven't enough knowledge to fully understand how to solve these 
issues, thus I'm afraid I'm not contributing to the buildroot community.

Best regards
Marco



-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/xml
Size: 92413 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160507/c2ea4140/attachment-0001.wsdl>
