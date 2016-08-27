From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 16:14:52 +0200
Subject: [Buildroot] [PATCH 05/16 v3] core: move rule to create basic
 directories
In-Reply-To: <11c12539-f62e-0e2b-c6e3-b6bb2e9a1c12@gmail.com>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <35c825b427c5e89497aafde9b787986eeeac1ad7.1468750623.git.yann.morin.1998@free.fr>
 <11c12539-f62e-0e2b-c6e3-b6bb2e9a1c12@gmail.com>
Message-ID: <20160827161452.6bb81433@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 6 Aug 2016 17:16:20 +0200, Romain Naour wrote:
> Hi Yann,
> 
> Le 17/07/2016 ? 12:34, Yann E. MORIN a ?crit :
> > Some of those directories will be needed even during configuration, like
> > BUILD_DIR, where we'll store the generated kconfig snippet.
> > 
> > So, move the rule to create them outside the HAVE_CONFIG block.  
> 
> You mean BR2_HAVE_DOT_CONFIG here, right ?

Yann, could you reply to this comment? I think Romain is right, but I
just want to be sure before fixing up myself when applying.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
