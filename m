From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Oct 2017 22:17:03 +0200
Subject: [Buildroot] [PATCH 6/6] lua-http: new package
In-Reply-To: <20170924161859.10994-6-francois.perrad@gadz.org>
References: <20170924161859.10994-1-francois.perrad@gadz.org>
 <20170924161859.10994-6-francois.perrad@gadz.org>
Message-ID: <20171003221703.6921e6cf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Sep 2017 18:18:59 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in              |  1 +
>  package/lua-http/Config.in     | 18 ++++++++++++++++++
>  package/lua-http/lua-http.hash |  2 ++
>  package/lua-http/lua-http.mk   | 14 ++++++++++++++
>  4 files changed, 35 insertions(+)
>  create mode 100644 package/lua-http/Config.in
>  create mode 100644 package/lua-http/lua-http.hash
>  create mode 100644 package/lua-http/lua-http.mk

Looks good to me. However, since it depends on PATCH 1/6, I'll wait
for a v2. I've merged the other patches, so please resend just
lpeg-patterns and lua-http.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
