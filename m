From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Feb 2013 22:45:54 +0100
Subject: [Buildroot] [PATCH 1/1] Added local directory as soure of
 kernel code
In-Reply-To: <511A78BA.4010200@mind.be>
References: <1360310725-6463-1-git-send-email-rafal.fabich@gmail.com>
 <1360310725-6463-2-git-send-email-rafal.fabich@gmail.com>
 <511A78BA.4010200@mind.be>
Message-ID: <20130212224554.40134349@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 12 Feb 2013 18:15:38 +0100, Arnout Vandecappelle wrote:

>   Looks like this is asked for over and over again, so I think it is 
> really worth adding this option. I think this was in fact briefly 
> discussed at the BR Developer Days but I didn't write it down in the 
> report...

I think that I managed to be convinced that for packages for which we
already support a way of configuring the source location (from Git,
from a custom tarball, etc.), it makes sense to also offer an option to
set a local location, even if technically it is redundant with what
<foo>_OVERRIDE_SRCDIR is doing.

So I agree with the approach, as long as we limit it to a few key
packages like the Linux kernel and bootloaders.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
