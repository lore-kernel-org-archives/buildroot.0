From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 19 Apr 2015 08:00:24 -0300
Subject: [Buildroot] [PATCH 11/14] packages: remove non-IPv6 enabler
	patches
In-Reply-To: <20150412145541.GM21018@free.fr>
References: <1428754662-27829-1-git-send-email-gustavo@zacarias.com.ar>
 <1428754662-27829-11-git-send-email-gustavo@zacarias.com.ar>
 <20150412145541.GM21018@free.fr>
Message-ID: <55338AC8.1080202@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/12/2015 11:55 AM, Yann E. MORIN wrote:
> We also have one patch dealing with IPv6 for lighttpd:
> 
>   - package/lighttpd/0001-Fix-default-config-file.patch
> 
>     @@ -90,7 +90,7 @@ server.port = 80
>      ##
>      ## Use IPv6?
>      ##
>     -server.use-ipv6 = "enable"
>     +# server.use-ipv6 = "enable"
>      
>      ##
>      ## bind to a specific IP
> 
>   - changes the default config to disable IPv6: do we want to keep that
>     hunk?
> 
> Otherwise:
> 
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

For this one i'm unsure how lighttpd will react to enabling ipv6 on a
non-ipv6 kernel, so i'll leave it as is.
Regards.
