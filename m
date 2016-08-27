From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 22:10:27 +0200
Subject: [Buildroot] [PATCH 10/16 v3] core: introduce per br2-external ID
In-Reply-To: <a161d4b17c131b471418e4fa979aa73129ad102c.1468750623.git.yann.morin.1998@free.fr>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <a161d4b17c131b471418e4fa979aa73129ad102c.1468750623.git.yann.morin.1998@free.fr>
Message-ID: <20160827221027.4fb4cc6c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Jul 2016 12:34:30 +0200, Yann E. MORIN wrote:
> This unique ID is used to construct a per br2-external tree variable,
> BR2_EXTERNAL_$(ID), which contains the path to the br2-external tree.

I would suggest to use the terminology "name" rather than "ID". I
think it's much easier to understand when using "name" that using "ID".
It's a bit longer, but not much, and will make things clearer.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
