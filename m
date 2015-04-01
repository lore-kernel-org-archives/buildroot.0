From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 15:17:39 +0200
Subject: [Buildroot] [PATCH 1/1] build host lz4 to support lz4
 compression in the kernel.
In-Reply-To: <20150401150237.4cabd12a@free-electrons.com>
References: <1427884257-20151-1-git-send-email-sagaert.johan@proximus.be>
 <20150401133722.6d6ab6c9@free-electrons.com>
 <551BE3C2.8020508@proximus.be>
 <20150401150237.4cabd12a@free-electrons.com>
Message-ID: <20150401151739.2d66d685@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Apr 2015 15:02:37 +0200, Thomas Petazzoni wrote:

> Yes, it works. But everyone now needs to build host-lzop and host-lz4
> before building a kernel even if they don't work.

s/work/need them/.

I should _really_ stop doing 3 things at the same time. My context
switching logic is so broken that I should do only one thing at once,
not more.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
