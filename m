From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 May 2014 09:52:12 +0200
Subject: [Buildroot] [PATCH] package/exim: fix static linking
In-Reply-To: <1401263274-12833-1-git-send-email-yann.morin.1998@free.fr>
References: <1401263274-12833-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140528095212.50b1d8f7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 28 May 2014 09:47:54 +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> When building static, we need to tell exim that it needs to link
> statically (obviously), and that it should link against pthreads.
> 
> Yet, exim is still not happy with that, as it still wants to build
> something (a version-related program) at install time, so we need
> to replicate the ld flags at install time.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reference to autobuilder failure, maybe? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
