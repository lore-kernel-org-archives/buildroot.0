From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Oct 2013 22:51:29 +0100
Subject: [Buildroot] [PATCH] pkgconf: fix upstream URL
In-Reply-To: <1383169829-31827-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1383169829-31827-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131030225129.0ebf245d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wed, 30 Oct 2013 22:50:29 +0100, Thomas Petazzoni wrote:
> The upstream URL has changed to
> http://rabbit.dereferenced.org/~nenolod/distfiles/, updated the
> Buildroot pkgconf package accordingly.
> 
> Fixes #6638.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Reported-by: <masrur.macece@gmail.com>
> Cc: <masrur.macece@gmail.com>
> ---
>  package/pkgconf/pkgconf.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-peter-2013.11.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
