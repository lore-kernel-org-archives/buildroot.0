From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 12 May 2012 01:37:30 +0200
Subject: [Buildroot] [PATCH 1/2] libtorrent: new package
In-Reply-To: <1336765188-20743-1-git-send-email-gustavo@zacarias.com.ar>
References: <1336765188-20743-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <4FADA2BA.3010507@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/11/12 21:39, Gustavo Zacarias wrote:
> +LIBTORRENT_DEPENDENCIES = host-pkg-config libsigc openssl
> +LIBTORRENT_CONF_OPT = --enable-aligned --enable-openssl

  Isn't the openssl dependency optional?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
