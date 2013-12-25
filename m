From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 10:09:18 +0100
Subject: [Buildroot] [PATCH] package/python-pycrypto: fix legal-info
In-Reply-To: <1387820388-30587-1-git-send-email-yann.morin.1998@free.fr>
References: <1387820388-30587-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20131225100918.4a9b8cd0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 23 Dec 2013 18:39:48 +0100, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> The pycrypto package contains a LICENSE.orig file, but apply-patches.sh
> removes all .orig file, so we can't list a .orig file asa license file,
> as it would have disapeared by the time 'make legal-info' sould be called.
> 
> Add a post-extract hook that renames this license file, so it is renamed
> just before we apply patches and remove .orig files.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Ryan Barnett <rjbarnet@rockwellcollins.com>
> ---
>  package/python-pycrypto/python-pycrypto.mk | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
