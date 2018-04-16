From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 17:44:23 +0200
Subject: [Buildroot] [PATCH 1/1] micropython: bump version to v1.9.3
In-Reply-To: <1523885614.4244.5.camel@flir.com>
References: <1523885614.4244.5.camel@flir.com>
Message-ID: <20180416174423.2a0e1c2e@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 Apr 2018 13:28:47 +0000, Blomme, Maarten wrote:
> (With correct formatting now)
> 
> The build step now requires building mpy-cross first.
> 
> Signed-off-by: Blomme, Maarten <Maarten.Blomme@flir.com>
> ---
>  package/micropython-lib/micropython-lib.hash | 2 +-
>  package/micropython-lib/micropython-lib.mk   | 2 +-
>  package/micropython/micropython.hash         | 2 +-
>  package/micropython/micropython.mk           | 7 ++++---
>  4 files changed, 7 insertions(+), 6 deletions(-)

I fixed up the breakage caused by your e-mail client or e-mail server,
and applied. Sadly in the process I forgot to adjust your commit log to
remove the "(With correct formatting now)" message, which shouldn't be
part of the commit log. Such messages should be placed below the "---"
marker after the Signed-off-by line. This way, they are part of the
e-mail being sent, but not considered by git as a part of the commit
log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
