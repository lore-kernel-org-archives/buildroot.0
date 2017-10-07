From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Oct 2017 23:12:17 +0200
Subject: [Buildroot] [PATCH 1/2] package/iucode-tool: security bump to
 version 2.2
In-Reply-To: <20171007110209.26248-1-bernd.kuhls@t-online.de>
References: <20171007110209.26248-1-bernd.kuhls@t-online.de>
Message-ID: <20171007231217.3c4aca8b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  7 Oct 2017 13:02:08 +0200, Bernd Kuhls wrote:
> Version 2.1.1 fixed CVE-2017-0357:
> https://gitlab.com/iucode-tool/iucode-tool/commit/657ce44ac462bcec35a3e12f9e7f53ca92ae62b7
> 
> Dropped IUCODE_TOOL_CONF_ENV after version 2.2 added a configure check
> for libargp:
> https://gitlab.com/iucode-tool/iucode-tool/commit/b14bed6771e7ab48371b272a0c68dd017767142a
> 
> Added hash for license file.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/iucode-tool/iucode-tool.hash | 3 ++-
>  package/iucode-tool/iucode-tool.mk   | 3 +--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
