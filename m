From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jan 2015 21:15:55 +0100
Subject: [Buildroot] [PATCH] dillo: zlib is a mandatory dependency
In-Reply-To: <1420741138-11738-1-git-send-email-gustavo@zacarias.com.ar>
References: <1420741138-11738-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150108211555.7eab9df0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu,  8 Jan 2015 15:18:58 -0300, Gustavo Zacarias wrote:
> Fixes:
> http://autobuild.buildroot.net/results/10f/10f7ba386a13753c942139b8bc13ca74d8932f3a/
> 
> Also reorder variables a bit and ditch duplicate addition.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/dillo/Config.in | 1 +
>  package/dillo/dillo.mk  | 7 ++-----
>  2 files changed, 3 insertions(+), 5 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
