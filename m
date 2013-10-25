From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 26 Oct 2013 01:21:04 +0200
Subject: [Buildroot] [PATCH 2/5] boost: add host variant
In-Reply-To: <1382703323-31038-2-git-send-email-gustavo@zacarias.com.ar>
References: <1382703323-31038-1-git-send-email-gustavo@zacarias.com.ar>
 <1382703323-31038-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <526AFCE0.5050606@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/10/13 14:15, Gustavo Zacarias wrote:
[snip]
> @@ -95,3 +127,4 @@ define BOOST_INSTALL_STAGING_CMDS
>   endef
>
>   $(eval $(generic-package))
> +$(eval $(host-autotools-package))

  Wow, did it suddenly become an autotools package? :-)

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
