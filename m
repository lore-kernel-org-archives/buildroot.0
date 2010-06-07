From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Jun 2010 09:23:12 +0200
Subject: [Buildroot] [PATCH] skeleton: remove loopback interface
 configuration from inittab
In-Reply-To: <acc7c503a6179494174d8225e121b23d69a24b61.1275543349.git.baruch@tkos.co.il>
References: <acc7c503a6179494174d8225e121b23d69a24b61.1275543349.git.baruch@tkos.co.il>
Message-ID: <20100607092312.7e736feb@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  3 Jun 2010 08:36:50 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> The lo interface is marked auto in /etc/network/interfaces, so the
> configuration of the loopback network interface is part of the
> S40network init script. This causes the "RTNETLINK answers: File exists" error
> message to appear at startup time.

Not tested, but I think it's ok.

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
