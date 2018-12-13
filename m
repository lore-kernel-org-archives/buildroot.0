From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 22:20:06 +0100
Subject: [Buildroot] [PATCH] nginx: bump to version 1.15.7
In-Reply-To: <20181211093900.6617-1-peter@korsgaard.com>
References: <20181211093900.6617-1-peter@korsgaard.com>
Message-ID: <20181213222006.4f637811@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Dec 2018 10:39:00 +0100, Peter Korsgaard wrote:
> 1.15.7 contains a number of bugfixes. From the changes file:
> 
>      *) Bugfix: memory leak on errors during reconfiguration.
> 
>     *) Bugfix: in the $upstream_response_time, $upstream_connect_time, and
>        $upstream_header_time variables.
> 
>     *) Bugfix: a segmentation fault might occur in a worker process if the
>        ngx_http_mp4_module was used on 32-bit platforms.
> 
> https://nginx.org/en/CHANGES
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/nginx/nginx.hash | 2 +-
>  package/nginx/nginx.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
