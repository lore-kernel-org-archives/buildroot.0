From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Jul 2012 14:39:53 +0200
Subject: [Buildroot] [PATCH v2] Remove -fPIC on x86_64
In-Reply-To: <4FFD68B9.9090202@mind.be>
References: <1342007359-8910-1-git-send-email-arnout@mind.be>
 <4FFD68B9.9090202@mind.be>
Message-ID: <20120711143953.183c8a0c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 11 Jul 2012 13:51:21 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

> On 07/11/12 13:49, Arnout Vandecappelle (Essensium/Mind) wrote:
> >   package/libgcrypt/libgcrypt.mk |    9 ---------
> 
>   Oops, that one shouldn't have slipped in...

And also the CCACHE_DISABLE bit I guess?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
