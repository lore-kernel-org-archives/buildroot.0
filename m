From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 22:43:39 +0100
Subject: [Buildroot] [PATCH 2/2] package/ser2net: bump to version 4.3.0
In-Reply-To: <20201123040405.2196833-2-james.hilliard1@gmail.com>
References: <20201123040405.2196833-1-james.hilliard1@gmail.com>
 <20201123040405.2196833-2-james.hilliard1@gmail.com>
Message-ID: <20201205224339.20a06eef@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 22 Nov 2020 21:04:05 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop patch that is now upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../0001-port.h-include-sys-time.h.patch      | 39 -------------------
>  package/ser2net/ser2net.hash                  |  6 +--
>  package/ser2net/ser2net.mk                    |  4 +-
>  3 files changed, 5 insertions(+), 44 deletions(-)
>  delete mode 100644 package/ser2net/0001-port.h-include-sys-time.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
