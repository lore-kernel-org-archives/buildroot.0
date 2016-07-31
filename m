From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jul 2016 22:56:28 +0200
Subject: [Buildroot] Analysis of build results for 2016-07-29
In-Reply-To: <20160731185647.GL3620@tarshish>
References: <20160730063032.3A6FE10161A@stock.ovh.net>
 <20160730232322.4eca1a53@free-electrons.com>
 <20160731185647.GL3620@tarshish>
Message-ID: <20160731225628.652767fd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 31 Jul 2016 21:56:47 +0300, Baruch Siach wrote:

> A missing comma in configure.ac breaks the build when using kernel v4.7+ 
> headers. A bump to version 4.13 (http://patchwork.ozlabs.org/patch/654388/) 
> fixes this issue.

Thanks! I saw that Peter committed the bump. Thanks for the
investigation!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
