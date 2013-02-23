From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 23 Feb 2013 10:25:31 +0100
Subject: [Buildroot] [PATCH] new package: gnome-keyring
In-Reply-To: <201302212305.27963.yann.morin.1998@free.fr>
References: <1361473406-5765-1-git-send-email-stefan.froberg@petroprogram.com>
 <201302212305.27963.yann.morin.1998@free.fr>
Message-ID: <51288B0B.80504@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/02/13 23:05, Yann E. MORIN wrote:
>> >+GNOME_KEYRING_CONF_ENV = LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
> This should point to the host-variant of libgcrypt-config.

  Huh? There is no host-libgcrypt...

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
