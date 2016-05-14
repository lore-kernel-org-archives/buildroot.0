From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 May 2016 16:20:28 +0200
Subject: [Buildroot] [PATCH] mali-t76x: depends on mesa3d-headers
In-Reply-To: <1463235396-17533-1-git-send-email-gustavo@zacarias.com.ar>
References: <1463235396-17533-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160514162028.0d8216b2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 14 May 2016 11:16:36 -0300, Gustavo Zacarias wrote:
> It selects them, but doesn't depend on them, and since the package only
> provides binaries there's a complete lack of headers. When some other
> package pulls in the egl/gles provider this doesn't result in headers
> being pulled in, hence the API is completely missing. Fixes:
> http://autobuild.buildroot.net/results/dab/dab91372b7bfde57796a7e3de7e823dc44adfb76/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/mali-t76x/mali-t76x.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
