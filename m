From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Mar 2014 15:54:22 +0100
Subject: [Buildroot] [PATCH] libtool: use a different way to avoid
 autoreconfiguration
In-Reply-To: <532A8C01.2070702@mind.be>
References: <1395270180-12701-1-git-send-email-arnout@mind.be>
 <20140320002504.0cebf7d5@skate> <532A8C01.2070702@mind.be>
Message-ID: <20140320155422.1ff40798@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 20 Mar 2014 07:34:41 +0100, Arnout Vandecappelle wrote:

> > Shouldn't we mark libtool on the target as something deprecated? We
> > have already removed the support for autoconf and automake on the
> > target, so having libtool seems quite useless, no?
> 
>  Pulseaudio depends on libtool. I guess it actually depends on libltdl,
> though. But is precisely in libltdl that the problem occurs.

But isn't the libltdl code normally "copied" into the project when
autoreconf is made, so that there should in fact not be any dependency
from pulseaudio to the target libtool?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
