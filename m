From: Sven Oliver Moll <buildroot@svol.li>
Date: Fri, 13 Nov 2020 15:31:06 +0100 (CET)
Subject: [Buildroot] kernel module from BR2_EXTERNAL-layer does not build
 automatically
Message-ID: <alpine.DEB.2.20.2011131229170.5784@defender.svolli.xa>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

for a private project, I have implemented a kernel module as a package in a 
BR2_EXTERNAL-defined layer. It's rather simple as lttng-modules. When I 
build it using "make kernel-package", it gets installed in target/... just 
fine, but if I make a clean build, the package will not be compiled and not 
be installed almost like it's not selected in .config at all, even though it 
is.

Any idea what's causing this, and how I could workaround this problem?
It happens on 2020.02.6 as well as 2020.08. Even a hint on what to 
investigage would help.


Thanks in advance,
SvOlli
-- 
|  _______       |
| (  /\          | Jesus Christ walks into a hotel. He hands the inn keeper
|__)v\/lli a.k.a.| three nails and asks: "Can you put me up for the night?"
|Sven Oliver Moll|   -- Eric Draven of The Crow by James O'Barr
