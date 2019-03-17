From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 17:54:50 +0100
Subject: [Buildroot] [PATCH] grpc: update to 1.18.0
In-Reply-To: <20190223021045.4383-1-tpiepho@impinj.com>
References: <20190223021045.4383-1-tpiepho@impinj.com>
Message-ID: <20190317175450.77b041d8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 23 Feb 2019 02:10:59 +0000
Trent Piepho <tpiepho@impinj.com> wrote:

> Bump version.  Freshen a patch that had a conflict.
> 
> Remove duplicate env setting.
> 
> Add comment about the hack being used to get gRPC to use the buildroot
> c-ares library.  Otherwise it looks like the cmake env settings are out
> of date vs what the gRPC build documentation says to use.
> 
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>
> ---
> I tested by running their sample app and making rpc calls to/from the target and
> the host.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
