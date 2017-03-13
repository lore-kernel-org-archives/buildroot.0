From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Mar 2017 13:33:45 +0100
Subject: [Buildroot] [PATCH 1/2] odroid-mali: fix broken headers.
In-Reply-To: <20170313090834.13715-1-daggs@gmx.com>
References: <20170313090834.13715-1-daggs@gmx.com>
Message-ID: <20170313133345.36d712f4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Mar 2017 11:08:33 +0200, Dagg Stompler wrote:

> upstream has updated the headers, (https://github.com/mdrjr/c2_mali/issues/1)
> it should fix failures such as http://autobuild.buildroot.net/results/ed8/ed8d562ae5fdb472a83f9a07b2f755c80c972c34/

Did you actually test building libepoxy with this bump, to verify that
not only it "should fix", but that it "really fixes".

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
