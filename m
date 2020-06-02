From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 2 Jun 2020 23:27:58 +0200
Subject: [Buildroot] [PATCH v1] package/edid-decode: bump version to
 1889504
In-Reply-To: <20200602210053.24091-1-ps.report@gmx.net>
References: <20200602210053.24091-1-ps.report@gmx.net>
Message-ID: <20200602232758.2c0ec0a4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  2 Jun 2020 23:00:53 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> - edid-decode changed from C to C++, adjust make command
>   accordingly

And so, it needs a BR2_INSTALL_LIBSTDCPP dependency ! :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
