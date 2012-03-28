From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 Mar 2012 23:34:02 +0200
Subject: [Buildroot] [PATCH v2 2/3] Add mobile-broadband-provider-info
	package.
In-Reply-To: <1332792756-3381-3-git-send-email-marek.belisko@open-nandra.com>
References: <1332792756-3381-1-git-send-email-marek.belisko@open-nandra.com>
 <1332792756-3381-3-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <201203282334.03591.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 26 March 2012 22:12:35 Marek Belisko wrote:
> +MOBILE_BROADBAND_PROVIDER_INFO_VERSION = master
> +MOBILE_BROADBAND_PROVIDER_INFO_SITE = git://git.gnome.org/mobile-broadband-provider-info

 Please use an explicit commit ID rather than 'master', otherwise the
build is not reproducible.

 Also, I prefer the http method for git access, because some firewalls
block git traffic.  (Actually, ideally the git method should be
updated to try http if the git access method fails...)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
