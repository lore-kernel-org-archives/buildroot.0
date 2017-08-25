From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Aug 2017 16:03:13 +0200
Subject: [Buildroot] [PATCH 3/3] mediastreamer: add dependency on
 host-vim
In-Reply-To: <20170821205516.20620-3-thomas.petazzoni@free-electrons.com>
References: <20170821205516.20620-1-thomas.petazzoni@free-electrons.com>
 <20170821205516.20620-3-thomas.petazzoni@free-electrons.com>
Message-ID: <20170825160313.0bbd9e8b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Aug 2017 22:55:16 +0200, Thomas Petazzoni wrote:
> host-vim is needed to provide the xxd tool, otherwise the build fails
> with:
> 
> checking for xxd... no
> configure: error: "xxd is required (provided by vim package)"
> 
> This isn't noticed by the autobuilders, presumably because all of them
> have vim installed locally.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/mediastreamer/mediastreamer.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
