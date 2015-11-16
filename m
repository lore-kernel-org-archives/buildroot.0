From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Nov 2015 21:27:47 +0100
Subject: [Buildroot] [PATCH 1/1] swig: use a relative path for the host
 swig2.0 symlink's target
In-Reply-To: <1447669504-10777-1-git-send-email-phil@zankapfel.net>
References: <1447669504-10777-1-git-send-email-phil@zankapfel.net>
Message-ID: <20151116212747.5b5de808@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Phil Eichinger,

On Mon, 16 Nov 2015 11:25:04 +0100, Phil Eichinger wrote:
> An absolute path isn't really necessary and breaks relocating
> 
> Signed-off-by: Phil Eichinger <phil@zankapfel.net>
> ---
>  package/swig/swig.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to the next branch, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
