From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Feb 2015 14:45:02 +0100
Subject: [Buildroot] [PATCH 10/11 v5] package/freerdp: install server
 key and certificate
In-Reply-To: <20150222131623.GB4016@free.fr>
References: <cover.1424558036.git.yann.morin.1998@free.fr>
 <4bfcb4d735dcded5ba4328260a13970af1023c0b.1424558036.git.yann.morin.1998@free.fr>
 <20150222124741.2743fb7c@free-electrons.com>
 <20150222131623.GB4016@free.fr>
Message-ID: <20150222144502.0c6b4ddf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 22 Feb 2015 14:16:23 +0100, Yann E. MORIN wrote:

> Yup, I forgot it.
> 
> But now I wonder what those should be: 0644 or 0600 ?

I was also unsure, and that's why I decided to not add the '-m' myself,
and open up the discussion. Is it problematic if a non-root user has
access to this key and certificate?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
