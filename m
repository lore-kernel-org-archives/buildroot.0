From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 16:24:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/mender: update readme.txt
In-Reply-To: <20190531123205.13418-1-mirza.krak@northern.tech>
References: <20190531123205.13418-1-mirza.krak@northern.tech>
Message-ID: <20190531162434.03f979a7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this patch.

On Fri, 31 May 2019 14:32:05 +0200
Mirza Krak <mirza.krak@northern.tech> wrote:

> Provide additional details on how Mender works within Buildroot.
> 
> Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
> ---
>  package/mender/readme.txt | 147 +++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 139 insertions(+), 8 deletions(-)
> 
> diff --git a/package/mender/readme.txt b/package/mender/readme.txt
> index 329b2a42f2..1afc7b6268 100644
> --- a/package/mender/readme.txt
> +++ b/package/mender/readme.txt
> @@ -3,16 +3,147 @@
>  Default configurations files
>  ----------------------------

This title was now duplicated, so I dropped this first one, since the
text below is an introduction to Mender, and you repeat the "Default
configuration files" later on.

I've also rewrapped the text, and then applied to master.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
