From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Feb 2019 22:10:32 +0100
Subject: [Buildroot] [PATCH v1] package/libv4l: bump version to 1.16.3
In-Reply-To: <20190212204230.27913-1-ps.report@gmx.net>
References: <20190212204230.27913-1-ps.report@gmx.net>
Message-ID: <20190215221032.06358c2d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Feb 2019 21:42:30 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Changes since 1.16.2:
>   - Makefile.am: don't use relative paths for include
>   - keytable: do not install bpf protocols decoders with execute permission
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/libv4l/libv4l.hash | 4 ++--
>  package/libv4l/libv4l.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Considering the number of commits (just two) and their impact, I
applied to master.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
