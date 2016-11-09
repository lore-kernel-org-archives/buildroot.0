From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 22:36:57 +0100
Subject: [Buildroot] [PATCH] screen: enable support for 256 colors
In-Reply-To: <20161109093629.5618-1-jezz@sysmic.org>
References: <20161109093629.5618-1-jezz@sysmic.org>
Message-ID: <20161109223657.36abadbb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  9 Nov 2016 10:36:29 +0100, J?r?me Pouiller wrote:
> Support for 256 colors is enabled in xterm and ncurses, but it was
> forgotten for screen.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/screen/screen.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
