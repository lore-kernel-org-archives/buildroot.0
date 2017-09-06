From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 22:20:03 +0200
Subject: [Buildroot] directfb: sources question
In-Reply-To: <75a027ac-8ace-cdbd-3171-e49558f7d5d2@ginzinger.com>
References: <75a027ac-8ace-cdbd-3171-e49558f7d5d2@ginzinger.com>
Message-ID: <20170906222003.6ee5a9b8@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 6 Sep 2017 08:46:27 +0200, Martin Kepplinger wrote:
> Since I looked for the directfb sources and failed to download it
> manually using directfb.mk: How would I download directfb 1.7.7?

From: http://sources.buildroot.net/DirectFB-1.7.7.tar.gz

> And are you sure https://github.com/deniskropp/DirectFB.git isn't the
> the place of the main sources where a possible release would happen?

I don't expect a new release of DirectFB, it's a dead project IMO.
However, if the sources there are similar to the 1.7.7 tarball we're
using today, we could use this github repository as our upstream for
the directfb package.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
