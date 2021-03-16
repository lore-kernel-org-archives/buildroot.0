From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 21:23:27 +0100
Subject: [Buildroot] [PATCH v1] package/elfutils: bump version to 0.183
In-Reply-To: <20210315210840.17649-1-ps.report@gmx.net>
References: <20210315210840.17649-1-ps.report@gmx.net>
Message-ID: <20210316212327.1ef053ed@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Mar 2021 22:08:40 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> - handle new zstd option (disable for host, optional for target)
> 
> For details see [1], [2].
> 
> [1] https://sourceware.org/pipermail/elfutils-devel/2020q4/003053.html
> [2] https://sourceware.org/pipermail/elfutils-devel/2021q1/003486.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...nable-disable-progs-configure-option.patch | 24 ++++++++++---------
>  package/elfutils/elfutils.hash                |  4 ++--
>  package/elfutils/elfutils.mk                  | 10 +++++++-
>  3 files changed, 24 insertions(+), 14 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
