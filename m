From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 22:34:10 +0200
Subject: [Buildroot] [PATCH 01/12] cgilua: bump to version 5.2.1
In-Reply-To: <20170902165642.22943-1-francois.perrad@gadz.org>
References: <20170902165642.22943-1-francois.perrad@gadz.org>
Message-ID: <20170902223410.6af4f285@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Sep 2017 18:56:31 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/cgilua/cgilua.hash | 2 +-
>  package/cgilua/cgilua.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Series applied to master. On the last two patches, I've added an entry
to the DEVELOPERS file for the new packages, and for the last patch,
I've added the <pkg>_LICENSE variable.

Could you have a look at adding <pkg>_LICENSE_FILES for all those Lua
packages ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
