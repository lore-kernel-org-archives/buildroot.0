From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Sep 2016 02:15:09 +0200
Subject: [Buildroot] [PATCH 0/5] grub2: add support for arm and aarch64
In-Reply-To: <20160913041548.10290-1-nunes.erico@gmail.com>
References: <20160913041548.10290-1-nunes.erico@gmail.com>
Message-ID: <c3f16bfb-5e1f-6135-11d1-e5cf7e226b52@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-09-16 06:15, Erico Nunes wrote:
> As a uboot platform, Grub 2 image gets built as a u-boot image (i.e.
> u-boot mkimage) and is loaded from u-boot through a regular "bootm".

 Perhaps a stupid question, but why would you want to do that? When you have a
working U-Boot, there is no need to stack Grub 2 on top of it, is there?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
