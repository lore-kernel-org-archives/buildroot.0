From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 23:28:50 +0100
Subject: [Buildroot] [PATCH] DEVELOPERS: Fix warning with get-developers
In-Reply-To: <20200106214357.14695-1-offougajoris@gmail.com>
References: <20200106214357.14695-1-offougajoris@gmail.com>
Message-ID: <20200106232850.57d2d279@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  6 Jan 2020 22:43:56 +0100
Joris Offouga <offougajoris@gmail.com> wrote:

> erlang-p1-iconv does not exist as a package in buildroot and cause warning
> with get-developers :
> 
> ./utils/get-developers -p erlang-p1-iconv
> WARNING: 'package/erlang-p1-iconv/' doesn't match any file
> 
> Signed-off-by: Joris Offouga <offougajoris@gmail.com>
> ---
>  DEVELOPERS | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
