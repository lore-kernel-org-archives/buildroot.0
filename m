From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jun 2016 17:11:09 +0200
Subject: [Buildroot] [PATCH 1/4] wayland: bump to version 1.11.0
In-Reply-To: <1464781037-26791-1-git-send-email-gustavo@zacarias.com.ar>
References: <1464781037-26791-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160601171109.3b8efe9e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Jun 2016 08:37:14 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/wayland/wayland.hash | 4 ++--
>  package/wayland/wayland.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

I've applied all four patches to next. However, can you send a
follow-up patch that drops AUTORECONF = YES from the weston package.
The 0002 patch has been removed since it's upstream, and it's
documented as the reason why we're doing an autoreconf. The other
remaining patch clearly doesn't need an autoreconf, and we're not
fetching from github or some other version control system, so it looks
like autoreconf can be dropped.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
