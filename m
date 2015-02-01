From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Feb 2015 23:19:32 +0100
Subject: [Buildroot] [PATCH] busybox: S01logging: implement restart
In-Reply-To: <1421753915-4313-1-git-send-email-richard.genoud@gmail.com>
References: <1421753915-4313-1-git-send-email-richard.genoud@gmail.com>
Message-ID: <20150201231932.75808b15@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Richard Genoud,

On Tue, 20 Jan 2015 12:38:35 +0100, Richard Genoud wrote:
> restart wasn't doing anything, and the expected behaviour is stop/start.
> 
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
> ---
>  package/busybox/S01logging | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
