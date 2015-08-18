From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 11:14:37 +0200
Subject: [Buildroot] [PATCH] package/batctl: bump to version 2015.1
In-Reply-To: <20150815171934.GA28760@vostro>
References: <20150815171934.GA28760@vostro>
Message-ID: <20150818111437.543f68e2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Sat, 15 Aug 2015 20:19:34 +0300, Alex Suykov wrote:
> musl fixes have been merged upstream, so the patch is no longer needed.
> 
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> ---
>  package/batctl/0001-musl-fixes.patch | 192 -----------------------------------
>  package/batctl/batctl.hash           |   4 +-
>  package/batctl/batctl.mk             |   2 +-
>  3 files changed, 3 insertions(+), 195 deletions(-)
>  delete mode 100644 package/batctl/0001-musl-fixes.patch

I've applied to next, after re-adding a sha256 hash to the hash file.
Having the upstream hash is definitely good, but we also want to have a
"strong" hash such as sha256/sha512 in the hash file.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
