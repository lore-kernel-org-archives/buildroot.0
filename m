From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 01 Nov 2012 00:06:47 +0100
Subject: [Buildroot] buildroot for AM3358 AM3359 with wireless-tools
 shared library
In-Reply-To: <1351683059.5576.42.camel@debian.fritz.box>
References: <50897A02.7000407@rie.eu> <20121025182332.GC5178@tarshish>
 <1351596954.5576.22.camel@debian.fritz.box> <20121030231327.4f22281c@skate>
 <1351683059.5576.42.camel@debian.fritz.box>
Message-ID: <5091AF07.5040803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/31/12 12:30, J?rgen Benjamin Ronshausen wrote:
> logfile1's size is 3MB, to big for pastebin, so i uploaded both to
> github
>
> https://github.com/steven11/the-hunt-for-wireless-tools

  gcc-intermediate's config thinks that largefile is enabled...  Can you post
output/toolchain/gcc-4.6.3-intermediate/gcc/config.status, config.log and
auto-host.h?

  BTW what kind of build machine do you use?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
