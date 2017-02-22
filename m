From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Feb 2017 21:31:40 +0100
Subject: [Buildroot] [PATCH] docs/website: Speedup javascript query
In-Reply-To: <1487793827-9204-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1487793827-9204-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20170222213140.35d75ab2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Feb 2017 21:03:47 +0100, Angelo Compagnucci wrote:
> This commit limits results from the javascript
> query for selecting messages from mailinglist.
> It was not limited before.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  docs/website/js/buildroot.js | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
