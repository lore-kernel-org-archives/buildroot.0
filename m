From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Dec 2015 22:07:04 +0100
Subject: [Buildroot] [PATCH] libsemanage: fix build error when linking
 with ustr
In-Reply-To: <1449174328-8317-1-git-send-email-sergio.prado@e-labworks.com>
References: <1449174328-8317-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20151203220704.306a6bf0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sergio,

On Thu,  3 Dec 2015 18:25:28 -0200, Sergio Prado wrote:
> Disable ustr inline functions to avoid multiple definition of symbols error
> when linking with ustr.
> 
> Fixes:
> http://autobuild.buildroot.net/results/e7012c7a734dbdd1c697cf63b6df6e834e8eafc7
> http://autobuild.buildroot.net/results/0783a63e4694ffa8463ef5533b635c7e7c43dd42
> http://autobuild.buildroot.net/results/40726abf3419a727c5762ef2791dbf53fa1736c0
> http://autobuild.buildroot.net/results/a6a0c827c393a5fb41653d71d1ee50df283a32fb
> ...
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>

There is another fix pending for this problem, which consists in
bumping the ustr version. See http://patchwork.ozlabs.org/patch/547117/
and http://patchwork.ozlabs.org/patch/547118/.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
