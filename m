From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 13:56:28 +0200
Subject: [Buildroot] [PATCH 1/4] swupdate: allowed luajit to enable
 HAVE_LUA
In-Reply-To: <20160724232739.14132-2-jordan@yelloz.me>
References: <20160724232739.14132-1-jordan@yelloz.me>
 <20160724232739.14132-2-jordan@yelloz.me>
Message-ID: <20161025135628.4eb8b649@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Jul 2016 16:27:36 -0700, Jordan Yelloz wrote:
> Signed-off-by: Jordan Yelloz <jordan@yelloz.me>
> ---
>  package/swupdate/swupdate.mk | 3 +++
>  1 file changed, 3 insertions(+)

I've applied, after updating it to use the luainterpreter virtual
package instead. I've also expanded the commit log to explain what's
going on. See
https://git.buildroot.org/buildroot/commit/?id=515ced20087407189bc5523a2bf7c19b239cb78d.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
