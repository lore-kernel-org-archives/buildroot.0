From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 22:43:36 +0100
Subject: [Buildroot] [PATCH 1/2] package/gensio: bump to version 2.2.0
In-Reply-To: <20201123040405.2196833-1-james.hilliard1@gmail.com>
References: <20201123040405.2196833-1-james.hilliard1@gmail.com>
Message-ID: <20201205224336.7ffa9573@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 22 Nov 2020 21:04:04 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Add patch backported from upstream to fix:
> sctp: Fix a compile problem when disabled
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...-Fix-a-compile-problem-when-disabled.patch | 31 +++++++++++++++++++
>  package/gensio/gensio.hash                    |  6 ++--
>  package/gensio/gensio.mk                      |  2 +-
>  3 files changed, 35 insertions(+), 4 deletions(-)
>  create mode 100644 package/gensio/0001-sctp-Fix-a-compile-problem-when-disabled.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
