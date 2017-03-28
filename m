From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Mar 2017 21:44:04 +0200
Subject: [Buildroot] [PATCH] mesa3d: drop unneeded libsha1 logic from
 Config.in
In-Reply-To: <20170328123021.18091-1-peter@korsgaard.com>
References: <20170328123021.18091-1-peter@korsgaard.com>
Message-ID: <20170328214404.1003ccbb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Mar 2017 14:30:21 +0200, Peter Korsgaard wrote:
> Commit 7f4e9490b647 (package/mesa3d: remove sha1 external dependency)
> removed the --with-sha1 logic from mesa3d.mk, but didn't remove the
> corresponding logic / comment from Config.in.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/mesa3d/Config.in | 4 ----
>  1 file changed, 4 deletions(-)

Applied to master, thanks. Good catch!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
