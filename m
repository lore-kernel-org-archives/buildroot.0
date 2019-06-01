From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 14:20:47 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/v4l2loopback: bump to
 version 0.12.2
In-Reply-To: <20190527185021.115590-1-james.hilliard1@gmail.com>
References: <20190527185021.115590-1-james.hilliard1@gmail.com>
Message-ID: <20190601142047.75ed9c16@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello James,

On Mon, 27 May 2019 12:50:21 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> This fixes a kernel 5.1.x compatibility issue.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> 
> ---
> Changes v1 -> v2:
>   - Use latest upstream tag instead of commit
> ---
>  package/v4l2loopback/v4l2loopback.hash | 2 +-
>  package/v4l2loopback/v4l2loopback.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

I've extended the commit log to explain why it is reasonable to bump
the version (as opposed to backporting just the fix), and I've applied
to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
