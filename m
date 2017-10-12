From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Oct 2017 22:05:18 +0200
Subject: [Buildroot] [V2] lua: refactor with a common template lua.pc.in
In-Reply-To: <20170821163723.14585-1-francois.perrad@gadz.org>
References: <20170821163723.14585-1-francois.perrad@gadz.org>
Message-ID: <20171012220518.40f034b7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Aug 2017 18:37:23 +0200, Francois Perrad wrote:
> lua.pc is generated from a common template in the build step.
> install steps are restored like in BR 2017.05
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lua/5.2.4/0004-lua-pc.patch | 42 -------------------------------------
>  package/lua/5.3.4/0004-lua-pc.patch | 42 -------------------------------------
>  package/lua/lua.mk                  | 14 +++++++------
>  package/lua/lua.pc.in               | 26 +++++++++++++++++++++++
>  4 files changed, 34 insertions(+), 90 deletions(-)
>  delete mode 100644 package/lua/5.2.4/0004-lua-pc.patch
>  delete mode 100644 package/lua/5.3.4/0004-lua-pc.patch
>  create mode 100644 package/lua/lua.pc.in

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
