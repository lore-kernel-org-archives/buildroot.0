From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 19:37:40 +0100
Subject: [Buildroot] [PATCH v2] gst1-imx: add menuconfig to select each
 plugin individually
In-Reply-To: <20160926081559.2062-1-gary.bisson@boundarydevices.com>
References: <20160926081559.2062-1-gary.bisson@boundarydevices.com>
Message-ID: <20170206193740.07f9311e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Sep 2016 10:15:59 +0200, Gary Bisson wrote:
> Also making it clearer as for what each plugin dependencies are.
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
> Hi all,

Applied to master, thanks. I've just inverted some of the conditions to
avoid the empty ifeq ... else statements.

Please check that the result is OK. Thanks! :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
