From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Nov 2015 23:44:21 +0100
Subject: [Buildroot] [PATCH v5 1/2] package/unscd: new package
In-Reply-To: <565CCC8C.3080106@mind.be>
References: <1448287096-18606-1-git-send-email-rdkehn@yahoo.com>
 <1448287096-18606-2-git-send-email-rdkehn@yahoo.com>
 <20151130224457.4baa3ab6@free-electrons.com>
 <565CCAEE.7070503@mind.be>
 <20151130232238.401bc727@free-electrons.com>
 <565CCC8C.3080106@mind.be>
Message-ID: <20151130234421.19d81f1c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 Nov 2015 23:24:12 +0100, Arnout Vandecappelle wrote:

>  7caf464 was applied to master only, and there has been no merge from master to
> next. So that explains it.

Ah damn, ok.

>  next will be gone soon so don't worry ;-)

Indeed.

Doug: can you resend a new version of the unscd patch, without the
attempt to integrate the installation of the glibc provided nscd
daemon? This way, we can merge unscd quickly, and then work on
installing the one from glibc if you are interested.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
