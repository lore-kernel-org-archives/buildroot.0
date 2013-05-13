From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 May 2013 11:27:30 +0200
Subject: [Buildroot] [PATCH 1/2] libtool : bump to version 2.4.2
In-Reply-To: <1368435466-8189-1-git-send-email-jeremy.rosen@openwide.fr>
References: <1368435466-8189-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <20130513112730.5ad21c4d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?my Rosen,

On Mon, 13 May 2013 10:57:45 +0200, J?r?my Rosen wrote:
> Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
> ---
>  package/libtool/libtool.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

How much testing did you do? Bumping libtool is a very sensitive thing,
because it used for all packages that we autoreconfigure. Therefore, I
believe such a bump should come with results of an allyespackageconfig
build before and after the bump.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
