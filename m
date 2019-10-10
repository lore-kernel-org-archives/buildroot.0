From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 09:05:05 +0200
Subject: [Buildroot] [PATCH 09/30] package/musl-fts: new package
In-Reply-To: <e1783520-5f18-5bd5-5de6-55825cdb32a9@mind.be>
References: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
 <20190922090646.15130-10-thomas.petazzoni@bootlin.com>
 <e1783520-5f18-5bd5-5de6-55825cdb32a9@mind.be>
Message-ID: <20191010090505.46ec76ad@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 10 Oct 2019 00:31:53 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>  Now this is applied, a couple of additional packages/options might be enabled
> as well...
> 
> - clamav's --disable-fanotify might be removed;
> - elfutils has a huge patch to add fts which might be removed;
> - libcgroup;
> - ltp-testsuite depends on !MUSL; neither the Config.in nor commit baedef979cda
> explain why exactly, but it might be due to fts.

Absolutely, there's a whole bunch of stuff that can be improved thanks
to this. But the series was already 30 patches long, so I thought it
was already enough.

Thanks for reviewing and merging!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
