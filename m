From: Al West <al.west@v-nova.com>
Date: Mon, 30 Mar 2015 12:35:38 +0000
Subject: [Buildroot] Building with CUDA but no X
Message-ID: <AMSPR03MB0513F1D64EB83431C2B38D5CEF50@AMSPR03MB051.eurprd03.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have a requirement where I want to build a system using Nvidia & CUDA.  However, in order to enable select of this option it is currently necessary to enable Modular X.org.  Would it be possible to use build root to install the Nvidia module and CUDA libraries without having to drag in a complete video rendering system.  I will try removing the requirement in package\nvidia-driver\Config.in

Thanks,
Al
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150330/47903371/attachment.html>
