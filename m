From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 21:00:50 +0100
Subject: [Buildroot] [PATCH] zeromq: unbreak pgm support
In-Reply-To: <1457466233-14933-1-git-send-email-gustavo@zacarias.com.ar>
References: <1457466233-14933-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160308210050.0642c1eb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue,  8 Mar 2016 16:43:53 -0300, Gustavo Zacarias wrote:
> In the bump to the 4.1.x series the bundled pgm library was dropped and
> the --with-system-pgm option was made pointless since using unbundled
> became the only option, so it was renamed to --with-pgm, which
> previously meant "use bundled" (but not any longer).
> However this wasn't accounted for and pgm support has been broken since
> then.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/zeromq/zeromq.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
