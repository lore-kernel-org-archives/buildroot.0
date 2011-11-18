From: kakuschky at elbe-net.de <kakuschky@elbe-net.de>
Date: Fri, 18 Nov 2011 20:00:07 +0100 (CET)
Subject: [Buildroot] kernel build name
In-Reply-To: <1047228267.70.1321642216649.JavaMail.root@zimbra>
Message-ID: <1387062378.76.1321642807551.JavaMail.root@zimbra>
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
