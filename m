From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Oct 2019 23:21:44 +0200
Subject: [Buildroot] [PATCH v1] package/collectd: needs host-bison
In-Reply-To: <20191003152922.21881-1-ps.report@gmx.net>
References: <20191003152922.21881-1-ps.report@gmx.net>
Message-ID: <20191005232144.4974bac8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  3 Oct 2019 17:29:22 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Since 5.9.1 the file src/liboconfig/parser.c is missing from the
> tar download file, triggering the need for host-bison.
> 
> Fixes [1]:
> 
>   configure: error: bison is missing and you do not have ./src/liboconfig/parser.c. Please install bison
> 
> [1] http://autobuild.buildroot.net/results/4e6f3e5fd0e64f166ae4f7db4832b37ae1fa99e0
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/collectd/collectd.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks. Could you report this issue to upstream, and
see if they consider this as a bug of their tarball, or if they want
users to install bison to build collectd?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
