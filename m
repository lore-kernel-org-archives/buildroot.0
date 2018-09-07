From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 7 Sep 2018 09:12:10 +0200
Subject: [Buildroot] [PATCH 1/1] mongoose: fix hash
In-Reply-To: <87musu3rpi.fsf@tkos.co.il>
References: <20180906214220.854-1-fontaine.fabrice@gmail.com>
 <87musu3rpi.fsf@tkos.co.il>
Message-ID: <20180907091210.6ad78022@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 07 Sep 2018 06:35:21 +0300, Baruch Siach wrote:

> Fabrice Fontaine writes:
> > When bumping to version 6.7, hash was not updated  
> 
> Commit 965c5ca57d3 (mongoose: bump to version 6.7) from April 2017, did
> update the hash to its current value. You can find a tarball with this
> hash at
> 
>   http://sources.buildroot.net/mongoose-6.7.tar.gz
> 
> But the current github download is indeed different. Not sure what went
> wrong here, but this description is not correct.

I saw Yann and Peter talking about github tarballs having changed again:

18:29 < Jacmet> hmm, looks like github tarballs again changed content :/
18:29 < Jacmet> http://autobuild.buildroot.net/results/599/599920bc0a5821fd3fb0a028574a25a22e12430f/build-end.log
18:42 < y_morin> Jacmet: At the same time, the fallback to s.b.o timeout, so maybe it is not a github issue either?
18:43 < Jacmet> y_morin: well, it did get a tarball from github and the hash didn't match
18:43 < y_morin> Jacmet: Arg, indeed. I even had another sha256 than the one in the report.
18:44 < Jacmet> y_morin: and downloading it from github here I also get the same (wrong) hash

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
