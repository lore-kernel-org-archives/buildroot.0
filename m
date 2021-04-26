From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Apr 2021 21:53:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/uftrace: needs threads
In-Reply-To: <20210426184255.500745-1-fontaine.fabrice@gmail.com>
References: <20210426184255.500745-1-fontaine.fabrice@gmail.com>
Message-ID: <20210426215351.21f29f42@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 26 Apr 2021 20:42:55 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> uftrace needs threads since its addition to buildroot in commit
> 09c97972d9f90b69cfc36f9ffe9e22c13daf9307
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d27c34a2f773aeb3c806d56dd2468d17caf2fbc6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/uftrace/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
