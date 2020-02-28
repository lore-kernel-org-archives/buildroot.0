From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Feb 2020 09:03:26 +0100
Subject: [Buildroot] Analysis of build results
In-Reply-To: <926B4573-B3E8-4912-8D3F-338764DDEF7E@benettiengineering.com>
References: <20200227234905.44125454@windsurf.home>
 <926B4573-B3E8-4912-8D3F-338764DDEF7E@benettiengineering.com>
Message-ID: <20200228090326.2e693610@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 28 Feb 2020 00:18:29 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> ... this too in 1-2 days at most.

Thanks!

> And as I?ve pointed libnss is waiting to be applied. Upstream almost applied it to, but we had a deal for PowerPC sys/auxv.h build failure.

Yes, I've seen you posted a new version of the patch.

> Btw did you all noticed an increase of NOK after adding the 2
> Micronova Autobuilders? They build fast but I don?t know in the
> complex how much they contribute.

You can see statistics over time at http://autobuild.buildroot.net/stats.php.

Bringing new builders doesn't really increase the number of failed
builds, but rather the overall number of builds. In the mean time, we
have fixed a number of build failures, which statistically reduces the
number of build failures overall.

I have also restarted builders on the Bootlin build server, gcc159 and
gcc160, so overall, we are getting quite a bit more of build results
compared to a few days ago.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
