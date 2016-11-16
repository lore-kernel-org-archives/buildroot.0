From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Nov 2016 17:36:05 +0100
Subject: [Buildroot] [PATCH v2 1/3] toolchain: workaround musl/kernel
 headers conflict
In-Reply-To: <20161116162520.6quaqjt3fllqphma@sapphire.tkos.co.il>
References: <b2085612a223f59a2f7ef18a9bd97603226aa03d.1478784433.git.baruch@tkos.co.il>
 <b08117ad-6edc-245d-0650-0db5eb1775ce@mind.be>
 <20161115233347.107fd31d@free-electrons.com>
 <20161116154516.w2e2wqerideqxsra@sapphire.tkos.co.il>
 <20161116165557.56fda400@free-electrons.com>
 <20161116162520.6quaqjt3fllqphma@sapphire.tkos.co.il>
Message-ID: <20161116173605.12aa2e5b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Nov 2016 18:25:20 +0200, Baruch Siach wrote:

> > So I believe we should apply your proposed workaround. However, I'm not
> > sure I want to take the risk of applying this to the master branch
> > (even though I agree it could fix some build failures). Are you OK with
> > applying it to the next branch?  
> 
> Of course. This is definitely not for master.

And any thoughts about my concerns to identify the packages that should
be re-enabled and patches that should be removed?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
