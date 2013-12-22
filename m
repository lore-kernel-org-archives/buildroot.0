From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Dec 2013 18:32:39 +0100
Subject: [Buildroot] [pkg-luarocks infra V4 07/10] lua-cjson: restore
 official name
In-Reply-To: <1384520859-3189-7-git-send-email-francois.perrad@gadz.org>
References: <1384520859-3189-1-git-send-email-francois.perrad@gadz.org>
 <1384520859-3189-7-git-send-email-francois.perrad@gadz.org>
Message-ID: <20131222183239.7778e004@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Fri, 15 Nov 2013 14:07:36 +0100, Francois Perrad wrote:
> (need by LuaRocks)
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  Config.in.legacy                                   |   10 ++++++++++
>  package/Config.in                                  |    2 +-
>  package/{luacjson => lua-cjson}/Config.in          |    4 ++--
>  .../luacjson.mk => lua-cjson/lua-cjson.mk}         |   21 ++++++++++----------
>  4 files changed, 23 insertions(+), 14 deletions(-)
>  rename package/{luacjson => lua-cjson}/Config.in (90%)
>  rename package/{luacjson/luacjson.mk => lua-cjson/lua-cjson.mk} (56%)

This looks good to me.

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
