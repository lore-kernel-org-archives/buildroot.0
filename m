From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 25 Oct 2017 00:14:47 +0200
Subject: [Buildroot] [RFC v4 4/4] package/runc: converting to golang
 infrastructure
In-Reply-To: <1508879672-12957-4-git-send-email-angelo.compagnucci@gmail.com>
References: <1508879672-12957-1-git-send-email-angelo.compagnucci@gmail.com>
 <1508879672-12957-4-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <f266218e-60f9-5c40-2756-66a9a9ad1468@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-10-17 23:14, Angelo Compagnucci wrote:
> -RUNC_GOTAGS = cgo static_build
> +RUNC_GO_TAGS = cgo static_build
>  
>  ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
>  RUNC_GOTAGS += seccomp

 I guess this should be RUNC_GO_TAGS?

 Regards,
 Arnout

>  RUNC_DEPENDENCIES += libseccomp host-pkgconf
>  endif

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
