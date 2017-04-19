From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Apr 2017 14:33:31 +0200
Subject: [Buildroot] [PATCH] gtest: fix usage on ARM platforms
In-Reply-To: <1492602712-28828-1-git-send-email-casantos@datacom.ind.br>
References: <1492602712-28828-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <20170419143331.384db10e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Apr 2017 08:51:52 -0300, Carlos Santos wrote:
> Ensure that GTest is compiled with -fPIC to allow linking the static
> libraries with dynamically linked programs. This is not a requirement
> for most architectures but is mandatory for ARM.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

Is this fixing an autobuilder issue? If so, the reference to the
autobuilder failure should be included in the commit log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
