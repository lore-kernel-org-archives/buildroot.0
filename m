From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Dec 2016 21:34:42 +0100
Subject: [Buildroot] [PATCH 1/2] nginx-naxsi: depends on
 BR2_PACKAGE_NGINX_HTTP
In-Reply-To: <1480948105-26691-1-git-send-email-johan.oudinet@gmail.com>
References: <1480948105-26691-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <20161205213442.63256c49@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Dec 2016 15:28:24 +0100, Johan Oudinet wrote:
> This package adds XSS and SQLi protection to Nginx HTTP server.
> So, it makes sense iff the HTTP part of nginx is enabled.
> 
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> ---
>  package/nginx-naxsi/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Thanks, I've applied both patches. However, I had to fix two things:

 - The indentation was wrong: you used spaces while Config.in entries
   are indented with one tab.

 - You forgot to add references to the autobuilder issues being fixed
   by those patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
