From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Dec 2013 18:23:56 +0100
Subject: [Buildroot] [pkg-luarocks infra V4 02/10] luajit: allow to
 build Lua extensions without lua
In-Reply-To: <1384520859-3189-2-git-send-email-francois.perrad@gadz.org>
References: <1384520859-3189-1-git-send-email-francois.perrad@gadz.org>
 <1384520859-3189-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <20131222182356.6ab0d7ed@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Fri, 15 Nov 2013 14:07:31 +0100, Francois Perrad wrote:
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/luajit/luajit-05-install-inc.patch |   17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 package/luajit/luajit-05-install-inc.patch

I don't understand what are the consequence of this patch or why it is
needed. Could you expand the commit log a little bit?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
