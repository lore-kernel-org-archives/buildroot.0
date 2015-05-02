From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 May 2015 09:44:56 +0200
Subject: [Buildroot] [PATCH v2 1/3] php: fpm sapi: install startup script
In-Reply-To: <1430503955-24928-2-git-send-email-bos@je-eigen-domein.nl>
References: <1430503955-24928-1-git-send-email-bos@je-eigen-domein.nl>
 <1430503955-24928-2-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20150502094456.3d41fc54@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Fri,  1 May 2015 20:12:33 +0200, Floris Bos wrote:
> Install the startup script if using the FastCGI Process Manager.
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> 
> ---
> v2: add systemd support
> ---
>  package/php/0006-fix-php-fpm.service.in.patch | 35 +++++++++++++++++++++++++++
>  package/php/php.mk                            | 15 ++++++++++++
>  2 files changed, 50 insertions(+)
>  create mode 100644 package/php/0006-fix-php-fpm.service.in.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
