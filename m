From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 21:44:54 +0100
Subject: [Buildroot] [PATCH] ifupdown: bump to version 0.8.8
In-Reply-To: <1453401915-7117-1-git-send-email-gustavo@zacarias.com.ar>
References: <1453401915-7117-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160221214454.0a912952@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 21 Jan 2016 15:45:15 -0300, Gustavo Zacarias wrote:
> Also add a kludge switching the explicit invocation of the ip binary
> from /bin to /sbin since that's where buildroot installs it.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/ifupdown/ifupdown.hash |  4 ++--
>  package/ifupdown/ifupdown.mk   | 13 +++++++++++--
>  2 files changed, 13 insertions(+), 4 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
