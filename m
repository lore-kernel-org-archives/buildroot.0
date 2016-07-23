From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 23:07:19 +0200
Subject: [Buildroot] [PATCH 2/2] zeromq: disable documentation
In-Reply-To: <1469295001-21786-2-git-send-email-gustavo@zacarias.com.ar>
References: <1469295001-21786-1-git-send-email-gustavo@zacarias.com.ar>
 <1469295001-21786-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160723230719.462280dc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Jul 2016 14:30:01 -0300, Gustavo Zacarias wrote:
> If asciidoc and xmlto are around it will automatically enable the
> documentation build which is pointless.
> Build time on i5-3330 with docs = 37s, without docs 25s.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/zeromq/zeromq.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
