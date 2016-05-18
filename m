From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 May 2016 23:54:26 +0200
Subject: [Buildroot] Analysis of build results for 2016-05-16
In-Reply-To: <8a1534c8-494c-2470-dcb3-f45b6da6f208@mind.be>
References: <20160517063022.7001A10142D@stock.ovh.net>
 <20160517153611.2a3b4199@free-electrons.com>
 <20160517171350.247927aa@x230.trabucayre.com>
 <20160517172040.630eda58@free-electrons.com>
 <20160518090907.09473795@x230.trabucayre.com>
 <8a1534c8-494c-2470-dcb3-f45b6da6f208@mind.be>
Message-ID: <20160518235426.785ae8c1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 May 2016 21:40:38 +0200, Arnout Vandecappelle wrote:

>   In my opinion, ICE issues are not really our problem. Since the user can 
> configure any kind of toolchain combination, I don't think it makes a whole lot 
> of sense even to add dependencies in the Config.in to avoid broken toolchains 
> (like we used to have for BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII).
> 
>   So I'd just add an autobuilder exception.

I'm hesitant to do this, because it means that normal users can also
fall into the problem.

On the other hand, it's annoying to encode all those exceptions in
Buildroot itself.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
