From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Oct 2019 00:31:53 +0200
Subject: [Buildroot] [PATCH 09/30] package/musl-fts: new package
In-Reply-To: <20190922090646.15130-10-thomas.petazzoni@bootlin.com>
References: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
 <20190922090646.15130-10-thomas.petazzoni@bootlin.com>
Message-ID: <e1783520-5f18-5bd5-5de6-55825cdb32a9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22/09/2019 11:06, Thomas Petazzoni wrote:
> This package provides a replacement implementation for <fts.h>
> functions missing from musl and uClibc-ng.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

 Now this is applied, a couple of additional packages/options might be enabled
as well...

- clamav's --disable-fanotify might be removed;
- elfutils has a huge patch to add fts which might be removed;
- libcgroup;
- ltp-testsuite depends on !MUSL; neither the Config.in nor commit baedef979cda
explain why exactly, but it might be due to fts.


 Regards,
 Arnout
