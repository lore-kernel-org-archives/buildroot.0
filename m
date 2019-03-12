From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Mar 2019 22:06:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/go: set GOCACHE to a host path
In-Reply-To: <20190312054114.21361-1-christian@paral.in>
References: <20190312054114.21361-1-christian@paral.in>
Message-ID: <20190312220641.524095f1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 11 Mar 2019 22:41:14 -0700
Christian Stewart <christian@paral.in> wrote:

> Set the GOCACHE environment variable properly.
> 
> It was previously unset, and defaults to $HOME/.cache/go-build.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/go/go.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
