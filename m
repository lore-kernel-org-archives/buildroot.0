From: kakuschky at elbe-net.de <kakuschky@elbe-net.de>
Date: Fri, 18 Nov 2011 20:01:35 +0100 (CET)
Subject: [Buildroot] kernel build name
In-Reply-To: <1759685407.78.1321642881642.JavaMail.root@zimbra>
Message-ID: <1071622422.80.1321642895370.JavaMail.root@zimbra>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, I'm just starting to explorer buildroot. Just one question. Where are the parts of the build name coming from?

If I use make menuconfig my target is named "arm-unknown-linux-uclibcgnueabi"

- arm is releated to the target platform
- linux o.k. it's a linux kernel I want to build
- eabi is the interface for embedded systems

The two I don't know are

- uclib is because I'm linking against GNU uclibc?
- unknown

Can somebody explain me where to set the part which is named "unknown" ?

Thanks & best regards Michael
