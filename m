From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Sep 2017 21:09:54 +0200
Subject: [Buildroot] [PATCH] support/tests: use relative test_dir
In-Reply-To: <20170905162137.18087-1-yann.morin.1998@free.fr>
References: <20170905162137.18087-1-yann.morin.1998@free.fr>
Message-ID: <20170905210954.119de6be@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Sep 2017 18:21:37 +0200, Yann E. MORIN wrote:
> When we list the available tests, we use test_dir, which is set from
> the path of the script. However, when we run the tests, we use the
> hard-coded path.
> 
> Ditto to find the config file.
> 
> For consistency, always use test_dir.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
>  support/testing/run-tests | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
