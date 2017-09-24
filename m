From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Sep 2017 15:06:03 +0200
Subject: [Buildroot] [PATCH 3/3] mpv: add support for Raspberry Pi "rpi"
 output
In-Reply-To: <20170914150238.31289-2-mahyar.koshkouei@gmail.com>
References: <20170914150238.31289-1-mahyar.koshkouei@gmail.com>
 <20170914150238.31289-2-mahyar.koshkouei@gmail.com>
Message-ID: <656fbb70-d75e-6495-34aa-c845c9323099@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-09-17 17:02, Mahyar Koshkouei wrote:
> mpv now compiles with the "rpi" video driver that provides hardware
> acceleration on the Raspberry Pi.
> 
> Tested working on a Raspberry Pi 1 Model B+.
> 
> Signed-off-by: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>

 I didn't apply this patch since there was still some discussion upstream [1] of
what the proper approach is.

[1] https://github.com/mpv-player/mpv/pull/4883


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
