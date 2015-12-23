From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Dec 2015 17:46:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/unscd: add PID file to init
 script
In-Reply-To: <1450878880-13335-1-git-send-email-rdkehn@yahoo.com>
References: <1450878880-13335-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <20151223174630.061fb385@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Doug Kehn,

On Wed, 23 Dec 2015 07:54:40 -0600, Doug Kehn wrote:
> unscd creates/manages it's own PID file. Pass PID file reference to
> start-stop-daemon.
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
> ---
>  package/unscd/S46unscd | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
