From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Sep 2019 19:28:41 +0200
Subject: [Buildroot] [PATCH] package/iperf3: bump to 3.7
In-Reply-To: <20190909195647.59390-1-matthew.weber@rockwellcollins.com>
References: <20190909195647.59390-1-matthew.weber@rockwellcollins.com>
Message-ID: <20190910192841.6910084a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  9 Sep 2019 14:56:47 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> - Dropped musl and profiling patches as they were incorporated upstream.
> - Profiling is set as explicitly disabled as it can now be configured.
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/iperf3/0001-disable-profiling.patch   | 20 ---------
>  .../0002-Fix-build-using-musl-libc.patch      | 43 -------------------
>  package/iperf3/iperf3.hash                    |  6 +--
>  package/iperf3/iperf3.mk                      |  4 +-
>  4 files changed, 6 insertions(+), 67 deletions(-)
>  delete mode 100644 package/iperf3/0001-disable-profiling.patch
>  delete mode 100644 package/iperf3/0002-Fix-build-using-musl-libc.patch

You forgot to explain in the commit log why the hash of the license
file was changed. So I looked it up, updated the commit log and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
