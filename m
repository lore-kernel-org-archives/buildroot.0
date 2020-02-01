From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Feb 2020 10:30:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/libmodsecurity: point to
 staging pcre-config
In-Reply-To: <20200131154257.12259-1-frank.vanbever@essensium.com>
References: <20200131154257.12259-1-frank.vanbever@essensium.com>
Message-ID: <20200201103009.080334a3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 31 Jan 2020 16:42:57 +0100
Frank Vanbever <frank.vanbever@essensium.com> wrote:

> The libmodsecurity build system uses the file installed on the host if not
> explicitly pointed to pcre-config in the staging dir.
> 
> Fixes:
> - http://autobuild.buildroot.net/results/f936ad05bca4bb776917306700750ba6d2498ef0
>   + similar failures for other architectures
> 
> Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
> ---
>  package/libmodsecurity/libmodsecurity.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
