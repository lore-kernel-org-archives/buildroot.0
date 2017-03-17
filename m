From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Mar 2017 17:14:27 +0100
Subject: [Buildroot] [PATCH 14/25] lua-bit32: new package
In-Reply-To: <55bf7d15-ebeb-6bbd-1eaf-c8657c5821fb@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
 <20170223170047.24417-15-arnout@mind.be>
 <20170302225441.5adee9f6@free-electrons.com>
 <55bf7d15-ebeb-6bbd-1eaf-c8657c5821fb@mind.be>
Message-ID: <20170317171427.03270127@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 2 Mar 2017 23:24:31 +0100, Arnout Vandecappelle wrote:

>  Well, like most of my packages it's a one-shot rather than something I actively
> use, so I tend not to add myself to the DEVELOPERS file.

Hum, ok, but then who will take care of fixing this package when/if it
breaks?

> If you do that, you could instead just add me for all orphaned
> packages. Hm, would that be a useful feature? A last-resort developer?

Is this really useful? You're part of the core developers, so I'm sure
you regularly look at the autobuild results e-mail that is sent on the
mailing list.

Or do you really want to implement a feature where build failures for
packages not affected to anyone are sent to you? It's not too difficult
to do.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
