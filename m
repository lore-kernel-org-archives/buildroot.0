From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 May 2016 14:25:33 +0200
Subject: [Buildroot] Which package for bluetooth management?
In-Reply-To: <572AFC1F.3070004@gmail.com>
References: <572A61D4.10905@gmail.com>
 <7132491b-5080-2001-1717-250d698244e9@mind.be>
 <572AEB2E.1050305@gmail.com> <572AFC1F.3070004@gmail.com>
Message-ID: <20160505142533.67f8e473@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 5 May 2016 09:54:07 +0200, Marco Trapanese wrote:

> - bluez4 is recommended with pulseaudio due to simpler configuration of 
> A2DP and HFP
> - but connman 1.32 doesn't support bluez4 anymore
> - but QtConnectivity doesn't support bluez5

I think it does, see https://patchwork.ozlabs.org/patch/612073/.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
