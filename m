From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 22:53:28 +0100
Subject: [Buildroot] [PATCH v3,3/3] package/solarus: disable tests
In-Reply-To: <20191215131358.3637959-3-fontaine.fabrice@gmail.com>
References: <20191215131358.3637959-1-fontaine.fabrice@gmail.com>
 <20191215131358.3637959-3-fontaine.fabrice@gmail.com>
Message-ID: <20191216225328.43ce881d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 15 Dec 2019 14:13:58 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Set -DSOLARUS_TESTS=OFF to disable tests (option added in version 1.6.1
> with:
> https://gitlab.com/solarus-games/solarus/commit/1829189c6050e36086b12c3806932e8657265467)
> 
> Reviewed-by: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/solarus/solarus.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
