From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Nov 2015 18:32:37 +0100
Subject: [Buildroot] [PATCH] Revert "openssl: enable parallel build and
 installation"
In-Reply-To: <1448295837-31204-1-git-send-email-yann.morin.1998@free.fr>
References: <1448295837-31204-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20151123183237.66e6d4cc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 23 Nov 2015 17:23:57 +0100, Yann E. MORIN wrote:
> This reverts commit 55e4ec054c21b9164e10c323a5f0afff1deb1d67.
> 
> There are still build failures in parallel builds:
>     http://autobuild.buildroot.org/results/9a0/9a0fc1064010a658155e6a18ec72e0e3c58ec7f6/
>     http://autobuild.buildroot.org/results/c28/c28064f383da1f577bd9227d004f1939daf4579f/
>     http://autobuild.buildroot.org/results/218/2180b9d900b27103acc92a2932f7ffa560b04831/
>     and so on...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ryan Barnett <rjbarnet@rockwellcollins.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/openssl/openssl.hash |  2 --
>  package/openssl/openssl.mk   | 12 +++++-------
>  2 files changed, 5 insertions(+), 9 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
