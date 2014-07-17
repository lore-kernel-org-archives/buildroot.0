From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 20:57:47 +0200
Subject: [Buildroot] [PATCH] musl: work around gcc 4.9.x bug
In-Reply-To: <1405601037-14395-1-git-send-email-gustavo@zacarias.com.ar>
References: <1405601037-14395-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140717205747.25b87213@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 17 Jul 2014 09:43:57 -0300, Gustavo Zacarias wrote:
> MUSL doesn't build happily with gcc 4.9.0/1 so work around the bug when
> appropiate as suggested by upstream.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/musl/musl.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
