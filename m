From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Apr 2019 15:02:46 +0200
Subject: [Buildroot] [PATCH 1/3] toolchain: add necessary options to
 support 5.0 kernel headers
In-Reply-To: <20190401123051.19455-1-shyam.saini@amarulasolutions.com>
References: <20190401123051.19455-1-shyam.saini@amarulasolutions.com>
Message-ID: <20190401150246.33d62c60@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  1 Apr 2019 18:00:49 +0530
Shyam Saini <shyam.saini@amarulasolutions.com> wrote:

> Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
> ---
>  toolchain/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)

5.0 headers are already supported in Buildroot, see:

  https://git.buildroot.org/buildroot/commit/toolchain?id=3385946b7ab709cc89aeee67195fb3bdd2422145

and related patches.

Make sure to rebase your patches on the latest master before sending
them, you would have noticed that this was already implemented.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
