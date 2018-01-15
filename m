From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Jan 2018 22:13:15 +0100
Subject: [Buildroot] [PATCH] scanpypi: add support for licence files
 checksums
In-Reply-To: <1516010690-7361-1-git-send-email-yegorslists@googlemail.com>
References: <1516010690-7361-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20180115221315.3b804fe8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 Jan 2018 11:04:50 +0100, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Store the list of detected licence files in the main object and
> automatically add their sha256 checksums when creating *.hash file.
> 
> Bonus: fix wrong indentation.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  utils/scanpypi | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
