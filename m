From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Jan 2018 23:20:43 +0100
Subject: [Buildroot] [PATCH] lua-utf8: new package
In-Reply-To: <20180114172512.15628-1-francois.perrad@gadz.org>
References: <20180114172512.15628-1-francois.perrad@gadz.org>
Message-ID: <20180116232043.3204483e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 14 Jan 2018 18:25:12 +0100, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in              |  1 +
>  package/lua-utf8/Config.in     |  7 +++++++
>  package/lua-utf8/lua-utf8.hash |  2 ++
>  package/lua-utf8/lua-utf8.mk   | 12 ++++++++++++
>  4 files changed, 22 insertions(+)
>  create mode 100644 package/lua-utf8/Config.in
>  create mode 100644 package/lua-utf8/lua-utf8.hash
>  create mode 100644 package/lua-utf8/lua-utf8.mk

Applied to master, thanks. It would be nice to ask the upstream
developer to add a license file to lua-utf8.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
