From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Dec 2015 13:52:47 +0100
Subject: [Buildroot] [PATCH] libgtk2: drop most of the LIBGTK2_CONF_ENV
 vars
In-Reply-To: <1449866800-28952-1-git-send-email-gustavo@zacarias.com.ar>
References: <1449866800-28952-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151212135247.5a4f3666@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 11 Dec 2015 17:46:40 -0300, Gustavo Zacarias wrote:
> Most are legacy from when the package was added and not really necessary.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libgtk2/libgtk2.mk | 52 ----------------------------------------------
>  1 file changed, 52 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
