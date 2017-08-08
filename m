From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Aug 2017 18:03:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/jack2: backport two build fixes
In-Reply-To: <20170806125840.5694-1-bernd.kuhls@t-online.de>
References: <20170806125840.5694-1-bernd.kuhls@t-online.de>
Message-ID: <2df71770-efec-7231-19a5-3b0b4c950e75@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-08-17 14:58, Bernd Kuhls wrote:
> 0005-gcc7.patch fixes
> http://autobuild.buildroot.net/results/c06/c0610325d7785dfa51c5d36775623ca8fa517f24/
> 
> 0006-fix-ftbfs-with-clang.patch
> fixes the subsequent build error:
> common/memops.c.31.o: In function `sample_move_dither_rect_d16_sSs':
> memops.c:(.text+0x4dc): undefined reference to `fast_rand'
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Applied to master, thanks.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
