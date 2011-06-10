From: Damien Bally <biribi@free.fr>
Date: Sat, 11 Jun 2011 00:41:41 +0200
Subject: [Buildroot] Statically linked binary segfaults
Message-ID: <4DF29DA5.4080900@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

mc2xml segfaults in buildroot (target = i686). The binary is available 
for download here (no source) : http://mc2xml.ueuo.com/

By the same time, it works perfectly in a distribution made from scratch 
with crosstool-ng.

I tried to use the crosstool-ng as external environment with buildroot 
with no change. The kernel binary was the same for testing.

Thanks for your help

Damien
