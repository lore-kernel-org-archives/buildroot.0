From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Oct 2017 15:59:32 +0200
Subject: [Buildroot] [PATCH v1] wiringpi: bump version to
 96344ff7125182989f98d3be8d111952a8f74e15 (the real 2.44)
In-Reply-To: <20171011131539.19407-1-ps.report@gmx.net>
References: <20171011131539.19407-1-ps.report@gmx.net>
Message-ID: <20171011155932.01b6cf48@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 11 Oct 2017 15:15:39 +0200, Peter Seiderer wrote:
> Fixes bug 10391 [1].
> 
> [1] https://bugs.busybox.net/show_bug.cgi?id=10391
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

I don't think it really fixes bug 10391. Bug 10391 is bogus by itself.
The update to 96344ff7125182989f98d3be8d111952a8f74e15 doesn't fix
anything, it only adds support for RPi Zero W.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
