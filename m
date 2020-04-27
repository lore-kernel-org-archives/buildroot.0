From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 22:10:49 +0200
Subject: [Buildroot] [PATCH] package/git: bump to 2.26.2
In-Reply-To: <20200427165853.17316-1-matthew.weber@rockwellcollins.com>
References: <20200427165853.17316-1-matthew.weber@rockwellcollins.com>
Message-ID: <20200427221049.58899ed4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 27 Apr 2020 11:58:53 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/git/git.hash | 2 +-
>  package/git/git.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/git/git.hash b/package/git/git.hash
> index 04e6002cd1..eb7e52ebde 100644
> --- a/package/git/git.hash
> +++ b/package/git/git.hash
> @@ -1,4 +1,4 @@
>  # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
> -sha256  888228408f254634330234df3cece734d190ef6381063821f31ec020538f0368  git-2.26.1.tar.xz
>  sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
>  sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
> +sha256  6d65132471df9e531807cb2746f8be317e22a343b9385bbe11c9ce7f0d2fc848  git-2.26.2.tar.xz

Why change the location of the hash? In addition, it is no longer next to the 

# From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc

comment. I've moved the hash back to where it was, and added another
comment mentioning that the license file hashes were locally calculated.

Applied with this change.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
