From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 7 Oct 2018 14:56:46 +0200
Subject: [Buildroot] [PATCH 1/1] cups-filters: add autoreconf
In-Reply-To: <20181006200245.8380-1-olivier.schonken@gmail.com>
References: <20181006200245.8380-1-olivier.schonken@gmail.com>
Message-ID: <20181007145646.3936b421@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  6 Oct 2018 22:02:45 +0200, Olivier Schonken wrote:
> Because we are patching Makefile.am, Makefile.am is newer than Makefile.in
> 
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>

The patch prefix should have indicated the target branch, i.e:

	[PATCH 2018.08.x]

Peter: this is for 2018.08.x and 2018.05.x.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
