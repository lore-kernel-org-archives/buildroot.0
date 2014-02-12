From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Feb 2014 17:55:37 +0100
Subject: [Buildroot] [PATCHv2 3/4] samba4: new package
In-Reply-To: <1392119829-31535-4-git-send-email-gustavo@zacarias.com.ar>
References: <1392119829-31535-1-git-send-email-gustavo@zacarias.com.ar>
 <1392119829-31535-4-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <52FBA789.3000806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/02/14 12:57, Gustavo Zacarias wrote:
> +ifeq ($(BR2_PACKAGE_GETTEXT),)
> +	SAMBA4_DEPDENDENCIES += --without-gettext
> +endif

 No dependency on gettext?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
