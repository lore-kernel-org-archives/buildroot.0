From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 18:42:26 +0100
Subject: [Buildroot] [PATCH] package/efl: disable Lua 5.2+ support
In-Reply-To: <1453590722-2490-1-git-send-email-romain.naour@gmail.com>
References: <1453590722-2490-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160221184226.4f7477a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sun, 24 Jan 2016 00:12:02 +0100, Romain Naour wrote:
> The efl are currently broken with Lua 5.2+.
> 
> See: https://phab.enlightenment.org/T2728
> 
> Avoid:
> http://autobuild.buildroot.net/results/e178371c2c3bf42d59c6fc26409e098081239ccb/
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/efl/Config.in | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
