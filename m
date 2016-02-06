From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 00:02:05 +0100
Subject: [Buildroot] [PATCH 1/6 v2] package/libgtk2: break a circular
 dependency
In-Reply-To: <20160206225310.GB3429@free.fr>
References: <cover.1453651102.git.yann.morin.1998@free.fr>
 <b493e6d4ca04b6171c2c7613f9abfdd6c0129861.1453651102.git.yann.morin.1998@free.fr>
 <20160206234634.37caec35@free-electrons.com>
 <20160206225310.GB3429@free.fr>
Message-ID: <20160207000205.2699d7e9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 6 Feb 2016 23:53:10 +0100, Yann E. MORIN wrote:

> I have absolutely no preference between the two.

There is indeed a subjective decision to be made here. But I believe
it's better to loose some relatively useless GUI programs, rather than
the some printing support in a GUI library.

> The only I'm tangentially interested in is the cups -> avahi
> dependency.

Fully agreed that keeping this dependency is important, and the most
important on of the chain.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
