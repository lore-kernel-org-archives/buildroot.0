From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 22:06:15 +0200
Subject: [Buildroot] [PATCH] libmbim: inherit BR2_USE_MMU dependency
 from libglib2
In-Reply-To: <20170906084327.22928-1-aleksander@aleksander.es>
References: <20170906084327.22928-1-aleksander@aleksander.es>
Message-ID: <20170906220615.4b7e5ac2@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  6 Sep 2017 10:43:27 +0200, Aleksander Morgado wrote:
> The USE_MMU dependency was missing from the chain of dependencies.
> 
> Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
> ---
>  package/libmbim/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
