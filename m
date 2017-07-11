From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Jul 2017 23:56:39 +0200
Subject: [Buildroot] [PATCH 2/3] fs/squashfs: align size to 1MiB
In-Reply-To: <20170711214837.GC2991@scaer>
References: <cover.1499703968.git.yann.morin.1998@free.fr>
 <03816ee56333f1eddb6ca8a048aea947fc027963.1499703968.git.yann.morin.1998@free.fr>
 <20170710232439.7dba43f1@windsurf.lan> <20170710213516.GB22898@scaer>
 <87pod6rak1.fsf@dell.be.48ers.dk> <20170711204204.GA2991@scaer>
 <2a123420-ecda-47a0-c0c3-155e3ad77f07@mind.be> <20170711214837.GC2991@scaer>
Message-ID: <0ea52e56-f239-cec4-2b25-a7bf3866f31a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-07-17 23:48, Yann E. MORIN wrote:
[snip]
> Would it be acceptable that the emulator class first truncates its input
> image to pad it to a 1MiB boundary, whatever the input image?

 To me it would make sense indeed to pad the emulated SD card to something that
could be an SD card.

 I'm by the way surprised that a similar issue doesn't occur for ext2. But
perhaps mke2fs already adds padding?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
