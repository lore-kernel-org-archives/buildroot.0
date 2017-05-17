From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 May 2017 21:57:26 +0200
Subject: [Buildroot] [PATCH 1/3] support/testing: rename
 check_broken_links to has_broken_links
In-Reply-To: <1494967531-6463-1-git-send-email-luca@lucaceresoli.net>
References: <1494967531-6463-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20170517215726.40eee338@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 May 2017 22:45:29 +0200, Luca Ceresoli wrote:
> has_broken_links makes it self-explanatory that this is a predicate
> function, and that the return value tells whether there _are_ broken
> links, not the opposite.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  support/testing/tests/toolchain/test_external.py | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Series applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
