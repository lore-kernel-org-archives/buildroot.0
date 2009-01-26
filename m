From: William Hegardt <whegardt@gmail.com>
Date: Mon, 26 Jan 2009 11:09:34 -0800
Subject: [Buildroot] 2009.02-rc2: ARM toolchain build fails
Message-ID: <484527250901261109m7a27933cg687c5bc7b0507fbd@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Attempting to build gcc 4.3.2 / uClibc 0.9.30 based tools for ARM7
uClinux target on CentOS 5.2 host.

I encounter the same problem mentioned here:
http://lists.busybox.net/pipermail/buildroot/2008-September/010792.html

Using the workarounds mentioned, I also get stuck compiling mudflap.

Other than choosing ARM7TDMI target architecture, the rest of the
buildroot configuration uses the defaults.

Anyone know of a way around this or a buildroot configuration that will work?
