From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Nov 2016 23:04:13 +0100
Subject: [Buildroot] [PATCH] busybox: allow the user to set the telnetd
 options
In-Reply-To: <1478534712-2470-1-git-send-email-michael@walle.cc>
References: <1478534712-2470-1-git-send-email-michael@walle.cc>
Message-ID: <20161107230413.6ae210d3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  7 Nov 2016 17:05:12 +0100, Michael Walle wrote:
> Source /etc/default/telnet to make it possible to override the telnetd
> arguments. For example a user may want to set an alternative port.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  package/busybox/S50telnet | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
