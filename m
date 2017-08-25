From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Aug 2017 16:03:09 +0200
Subject: [Buildroot] [PATCH 2/3] vim: add host variant
In-Reply-To: <20170821205516.20620-2-thomas.petazzoni@free-electrons.com>
References: <20170821205516.20620-1-thomas.petazzoni@free-electrons.com>
 <20170821205516.20620-2-thomas.petazzoni@free-electrons.com>
Message-ID: <20170825160309.4c1297d0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Aug 2017 22:55:15 +0200, Thomas Petazzoni wrote:
> Vim contains a tool called xxd, which is needed by mediastreamer on
> the host as part of its build process. Therefore, this commit
> introduces a host variant for the vim package, that will be used by
> mediastreamer.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/vim/vim.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
