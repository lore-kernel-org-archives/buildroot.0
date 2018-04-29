From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Apr 2018 09:58:48 +0200
Subject: [Buildroot] [PATCH 1/1] support/testing: set $USER in rust tests
In-Reply-To: <20180428221413.1833-1-eric.le.bihan.dev@free.fr>
References: <20180428221413.1833-1-eric.le.bihan.dev@free.fr>
Message-ID: <20180429095848.670ae225@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Apr 2018 00:14:13 +0200, Eric Le Bihan wrote:
> When the run-time tests to build rust and rust-bin packages are run via Docker,
> the $USER environment variable is not set, which makes cargo fail when
> initializing the test project.
> 
> So add it to make cargo happy.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  support/testing/tests/package/test_rust.py | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
