From: Chris Packham <judge.packham@gmail.com>
Date: Wed, 16 Sep 2020 19:12:30 +1200
Subject: [Buildroot] [PATCH 1/1] package/micropython: fix license hash
In-Reply-To: <20200915172035.6871-1-fontaine.fabrice@gmail.com>
References: <20200915172035.6871-1-fontaine.fabrice@gmail.com>
Message-ID: <CAFOYHZCj0PHfrnSjiU2cdQNDpAC4mJodJjc7VV4YNxuz8gQFqg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 16 Sep 2020, 5:20 AM Fabrice Fontaine, <fontaine.fabrice@gmail.com>
wrote:

> Commit 7676191cfacbdb1a92af1d0218d3280207b03090 forgot to update
> license hash which changed due to an update in year:
>
> https://github.com/micropython/micropython/commit/338b12d3c840ea56504c83d9c51e4d0f628684f4
>
> While at it, also update indentation in hash file (two spaces)
>
> Fixes:
>  -
> http://autobuild.buildroot.org/results/2a650636965d8575374333f847acc169caf8d2ac
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>

Thanks for picking that up.

 package/micropython/micropython.hash | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/micropython/micropython.hash
> b/package/micropython/micropython.hash
> index 4ca3f8402f..5dfbb74522 100644
> --- a/package/micropython/micropython.hash
> +++ b/package/micropython/micropython.hash
> @@ -1,3 +1,3 @@
>  #locally computed
> -sha256 31466dacebeb3af60dc80a071a07c3e15b657219a826e0b6ac741f9f22472f23
> micropython-1.13.tar.gz
> -sha256 afde3432122205e8e08d615fcb920aca58631c52b6c0c01813854287a457b298
> LICENSE
> +sha256  31466dacebeb3af60dc80a071a07c3e15b657219a826e0b6ac741f9f22472f23
> micropython-1.13.tar.gz
> +sha256  4b8a8884a60cd72749f9ef40328b85b40d13c22594c01352e0a55392141e0f89
> LICENSE
> --
> 2.28.0
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200916/8a90db5c/attachment.html>
