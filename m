From: =?ISO-8859-1?Q?J=FCrgen?= Benjamin Ronshausen <b.r@rie.eu>
Date: Wed, 07 Nov 2012 12:04:28 +0100
Subject: [Buildroot] buildroot for AM3358 AM3359 with wireless-tools
 shared library
In-Reply-To: <5091AF07.5040803@mind.be>
References: <50897A02.7000407@rie.eu> <20121025182332.GC5178@tarshish>
 <1351596954.5576.22.camel@debian.fritz.box> <20121030231327.4f22281c@skate>
 <1351683059.5576.42.camel@debian.fritz.box>  <5091AF07.5040803@mind.be>
Message-ID: <1352286268.3710.9.camel@debian.fritz.box>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sorry it took me so long.

regards J?rgen

output/toolchain/gcc-4.6.3-intermediate/gcc/config.status

http://pastebin.com/fLGkJmKi

config.log

http://pastebin.com/WEZd2w7n

auto-host.h

http://pastebin.com/sJZXZvAN

On Thu, 2012-11-01 at 00:06 +0100, Arnout Vandecappelle wrote:
> On 10/31/12 12:30, J?rgen Benjamin Ronshausen wrote:
> > logfile1's size is 3MB, to big for pastebin, so i uploaded both to
> > github
> >
> > https://github.com/steven11/the-hunt-for-wireless-tools
> 
>   gcc-intermediate's config thinks that largefile is enabled...  Can you post
> output/toolchain/gcc-4.6.3-intermediate/gcc/config.status, config.log and
> auto-host.h?
> 
>   BTW what kind of build machine do you use?
> 
>   Regards,
>   Arnout
