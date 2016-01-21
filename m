From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Jan 2016 11:32:35 +0100
Subject: [Buildroot] [PATCH] package/x11r7/xlib_libfontenc: select zlib
In-Reply-To: <1452114598-6861-1-git-send-email-romain.naour@gmail.com>
References: <1452114598-6861-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160121113235.5e65b547@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Wed,  6 Jan 2016 22:09:58 +0100, Romain Naour wrote:
> xlib_libfontenc depends on the zlib package but doesn't select it.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/x11r7/xlib_libfontenc/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
