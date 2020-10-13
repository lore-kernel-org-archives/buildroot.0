From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Oct 2020 13:34:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/quazip: fix legal info
In-Reply-To: <20201012185704.2753882-1-fontaine.fabrice@gmail.com>
References: <20201012185704.2753882-1-fontaine.fabrice@gmail.com>
Message-ID: <20201013133456.1b80de3b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 12 Oct 2020 20:57:04 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Update hash of COPYING (QuaZIP renamed into QuaZip since version 1.0 and
> https://github.com/stachenov/quazip/commit/5bd87270bd9c0dbe99c102e5b442e1fe142166be)
> 
> While at it, update indentation (two spaces)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4a8dc1be76d9f08d44b158f39734932793348a03
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/quazip/quazip.hash | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
