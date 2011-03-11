From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 11 Mar 2011 19:48:17 +0100
Subject: [Buildroot] SingleStep Linux Kernel with BDI200
In-Reply-To: <AANLkTin67wa+HwN6CGKR9LP6YOuArDn8FW=gwgUMGD+K@mail.gmail.com>
References: <AANLkTin67wa+HwN6CGKR9LP6YOuArDn8FW=gwgUMGD+K@mail.gmail.com>
Message-ID: <AANLkTin6p-SaOJ12g2jw+9HdBSpTSF0VPMmSAEKuoOWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
> Can someone help me figure out how to create a cross gdb so I can get to the
> next step, please?

Did you enable building gdb in the buildroot configuration?
(BR2_PACKAGE_GDB_HOST)
