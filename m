From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Sep 2017 22:02:04 +0200
Subject: [Buildroot] [PATCH 1/2] pkgconf: update upstream URL in
	Config.in
In-Reply-To: <20170919110527.23975-1-peter@korsgaard.com>
References: <20170919110527.23975-1-peter@korsgaard.com>
Message-ID: <d1b635cd-6338-00b8-5be7-82c33b77c53f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19-09-17 13:05, Peter Korsgaard wrote:
> The download location got changed two years ago when the version was bumped
> to 0.9.12, but the upstream URL in Config.in wasn't updated.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 Applied both to master, thanks.

 Regards,
 Arnout

> ---
>  package/pkgconf/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkgconf/Config.in b/package/pkgconf/Config.in
> index f95847fa3c..9d5d9ab194 100644
> --- a/package/pkgconf/Config.in
> +++ b/package/pkgconf/Config.in
> @@ -6,4 +6,4 @@ config BR2_PACKAGE_PKGCONF
>  	  but was written from scratch in the summer of 2011 to replace
>  	  pkg-config, which now needs itself to build itself
>  
> -	  https://github.com/nenolod/pkgconf
> +	  https://github.com/pkgconf/pkgconf
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
