From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Oct 2016 17:41:39 +0200
Subject: [Buildroot] [PATCH v2 1/3] inadyn: do not install default conf
 file
In-Reply-To: <20161017142524.12026-1-bluemrp9@gmail.com>
References: <20161017142524.12026-1-bluemrp9@gmail.com>
Message-ID: <20161017174139.260ee7be@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Oct 2016 07:25:22 -0700, Ryan Coe wrote:

> The default conf file is not usable without modification.

Right, but it provide a good starting point.

> It is also not compatible with the newer 2.0 series.

This is not really an excuse, it should simply be updated together with
the bump to 2.0.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
