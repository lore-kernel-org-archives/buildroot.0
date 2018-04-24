From: =?utf-8?Q?Micha=C5=82_Kalbarczyk?= <michal@gamecodehq.com>
Date: Tue, 24 Apr 2018 14:01:28 +0200
Subject: [Buildroot] Chromium
In-Reply-To: <20180423212505.68654293@windsurf>
References: <5B0BF4C3-9DC5-4199-BB4E-2B303C3EF2C8@gamecodehq.com>
 <20180423212505.68654293@windsurf>
Message-ID: <8319B51E-D49A-4E02-A69E-16602EF168EF@gamecodehq.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the reply,

How should I start? 

These are steps to build chromium:

* Checkout https://chromium.googlesource.com/chromium/tools/depot_tools.git <https://chromium.googlesource.com/chromium/tools/depot_tools.git>
* make it in path
* run fetch --no-history --nohooks chromium
* will download sources
* cd src
* run gclient runhooks
* run gn gen out/Default
* run ninja -C out/Default -o chromium

Best regards,
Micha?


> On 23 Apr 2018, at 21:25, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> 
> Hello,
> 
> On Mon, 23 Apr 2018 13:15:36 +0200, Micha? Kalbarczyk wrote:
> 
>> Is there any chance to build chromium in build root environment?
>> Found few old makefiles, but nothing actually works. Is this
>> possible? 
> 
> Yes, I believe it is possible, I don't see why it wouldn't be. Now,
> Chromium is clearly not the easiest software to build, and therefore to
> package in Buildroot.
> 
> So doable: yes, easy: definitely no.
> 
> In any case, we're interested in having patches submitted to Buildroot
> to add such a package.
> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180424/daf9b606/attachment.html>
