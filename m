From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 31 Jul 2012 17:19:42 +0200
Subject: [Buildroot] [PATCH v2] sconeserver: new package
In-Reply-To: <1343382707-2698-1-git-send-email-spdawson@gmail.com>
References: <1343382707-2698-1-git-send-email-spdawson@gmail.com>
Message-ID: <5017F78E.4010004@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/27/12 11:51, spdawson at gmail.com wrote:
[snip]
> +config BR2_PACKAGE_SCONESERVER_UI
> +	bool "ui"
> +	select BR2_PACKAGE_XLIB_LIBX11
> +	help
> +	  UI module for Sconeserver

  And another thing: this should have a
select BR2_PACKAGE_XORG7

  Regards,
  Arnout

[snip]
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
