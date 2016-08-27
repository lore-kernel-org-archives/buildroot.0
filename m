From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 21:37:59 +0200
Subject: [Buildroot] [PATCH] package/protobuf: uses fork(),
 not available on no-MMU platforms
In-Reply-To: <1472320896.3953.4.camel@embedded.rocks>
References: <20160827001703.18155-1-joerg.krause@embedded.rocks>
 <20160827151211.3984639c@free-electrons.com>
 <1472320896.3953.4.camel@embedded.rocks>
Message-ID: <20160827213759.35bc3d69@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 27 Aug 2016 20:01:36 +0200, J?rg Krause wrote:

> Many thanks for improving the commit! However, there a some packages
> which have an architecture dependency where the no-MMU dependency is
> not added to the architecture dependency, e.g. gauche. Should those
> packages be revised, too?

Yes, I'd say so.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
