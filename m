From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Aug 2017 21:46:49 +0200
Subject: [Buildroot] [PATCH 4/6] package/libconfig: switch to github
In-Reply-To: <20170829191005.19697-4-bernd.kuhls@t-online.de>
References: <20170829191005.19697-1-bernd.kuhls@t-online.de>
 <20170829191005.19697-4-bernd.kuhls@t-online.de>
Message-ID: <20170829214649.0c3bf1b4@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Aug 2017 21:10:03 +0200, Bernd Kuhls wrote:
> The previous site does not provide the package anymore.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libconfig/libconfig.hash | 2 +-
>  package/libconfig/libconfig.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libconfig/libconfig.hash b/package/libconfig/libconfig.hash
> index 30110cbbd..00d3bd6bd 100644
> --- a/package/libconfig/libconfig.hash
> +++ b/package/libconfig/libconfig.hash
> @@ -1,2 +1,2 @@
>  # Locally computed:
> -sha256  e31daa390d8e4461c8830512fe2e13ba1a3d6a02a2305a02429eec61e68703f6  libconfig-1.5.tar.gz
> +sha256 cae5c02361d8a9b2bb26946c64f089d2e5e599972f386203fbc48975c0d885c8  libconfig-v1.5.tar.gz

Are there some important source code changes between those two versions
labeled 1.5 ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
