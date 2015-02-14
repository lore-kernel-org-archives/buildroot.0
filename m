From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 22:02:04 +0100
Subject: [Buildroot] [PATCH] package/libssh2: fix zlib library search
 path issues
In-Reply-To: <1423935508-12682-1-git-send-email-romain.naour@openwide.fr>
References: <1423935508-12682-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150214220204.6f2115c9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 14 Feb 2015 18:38:28 +0100, Romain Naour wrote:
> Like for lingcrypt and openssl, help the configure script to find
> zlib installed in STAGING_DIR.
> 
> Otherwise, It might find the one installed on the host:
> checking how to link with libz... /usr/lib/libz.so -Wl,-rpath -Wl,/usr/lib
> 
> Fixes:
> http://autobuild.buildroot.net/results/93b/93b43e114f21a22f0f8b7d7dd6774c089c426cd1
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/libssh2/libssh2.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
