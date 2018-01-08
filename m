From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Jan 2018 21:28:27 +0100
Subject: [Buildroot] [PATCH v2 01/13] pkg-{download,
 generic}: remove source-check
In-Reply-To: <20171025201003.16105-2-ps.report@gmx.net>
References: <20171025201003.16105-1-ps.report@gmx.net>
 <20171025201003.16105-2-ps.report@gmx.net>
Message-ID: <20180108212827.4d876213@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 25 Oct 2017 22:09:51 +0200, Peter Seiderer wrote:
> From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> 
> This feature is not used by anyone in the core developpers and makes a
> drastic simplification of the pkg-download infrastructure harder.
> 
> The future patch will move much of what's in the current pkg-download.mk
> file into the dl-wrapper which is a shell script.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
> Changes v1 --> v2:
>  - from https://github.com/maximeh/buildroot/commit/a4d0e83729a1ab534ff99d6f258058a1be1ed949.patch
>  - remove more references to source-check (suggested by Thomas Petazzoni)
> ---
>  Makefile                |  7 +------
>  package/pkg-download.mk | 44 --------------------------------------------
>  package/pkg-generic.mk  | 14 +-------------
>  3 files changed, 2 insertions(+), 63 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
