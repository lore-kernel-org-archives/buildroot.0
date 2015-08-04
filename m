From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Aug 2015 20:04:14 +0200
Subject: [Buildroot] [PATCH 1/1] libjpeg-turbo (turbo-jpeg): bump 1.4.0
 to 1.4.1
In-Reply-To: <1438709966-3154-1-git-send-email-yba@tkos.co.il>
References: <1438709966-3154-1-git-send-email-yba@tkos.co.il>
Message-ID: <20150804200414.488272fb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jonathan Ben-Avraham,

The title should just be:

	<package>: <description>

so in your case:

	jpeg-turbo: bump version from 1.4.0 to 1.4.1

On Tue,  4 Aug 2015 20:39:26 +0300, Jonathan Ben-Avraham wrote:
> From: Jonathan Ben Avraham <yba@tkos.co.il>
> 
> 
> Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
> ---
>  package/jpeg-turbo/jpeg-turbo.hash |    3 +--
>  package/jpeg-turbo/jpeg-turbo.mk   |    2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
> index bbc62f2..940802f 100644
> --- a/package/jpeg-turbo/jpeg-turbo.hash
> +++ b/package/jpeg-turbo/jpeg-turbo.hash
> @@ -1,3 +1,2 @@
>  # From http://sourceforge.net/projects/libjpeg-turbo/files/1.4.0/

Is this link still accurate?

> -sha1	a9ed7a99a6090e0848836c5df8e836f300a098b9  libjpeg-turbo-1.4.0.tar.gz
> -md5	039153dabe61e1ac8d9323b5522b56b0  libjpeg-turbo-1.4.0.tar.gz
> +sha256 4bf5bad4ce85625bffbbd9912211e06790e00fb982b77724af7211034efafb08	libjpeg-turbo-1.4.1.tar.gz

I don't see any reference to this hash in
http://sourceforge.net/projects/libjpeg-turbo/files/1.4.1/. Am I
missing something?

If no hashes are provided anymore, and this hash has been locally
calculated, just say so:

# Locally calculated
sha256 <hash> <tarball>

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
