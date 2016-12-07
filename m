From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Dec 2016 23:58:25 +0100
Subject: [Buildroot] [PATCH v7 1/1] rpm: switch to version 4.13.0
In-Reply-To: <20161207235705.258ff2b2@free-electrons.com>
References: <20161118185053.11976-1-james.knight@rockwellcollins.com>
 <20161130233052.6d72115b@free-electrons.com>
 <20161207235705.258ff2b2@free-electrons.com>
Message-ID: <20161207235825.16edfc29@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

(Sorry for the previous empty e-mail)

On Wed, 7 Dec 2016 23:57:05 +0100, Thomas Petazzoni wrote:

> > If you read the COPYING file, it's in fact GPLv2, or LGPLv2 but for the
> > library only. So I've adjusted the license information here.
> > 
> > I've applied to next, the rest of the patch seemed reasonable.

This new rpm package causes lots of build failures:

  http://autobuild.buildroot.net/?reason=rpm-4.13.0

Could you have a look and provide patches to fix those issues?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
