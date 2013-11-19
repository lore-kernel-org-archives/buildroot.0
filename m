From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Nov 2013 14:20:58 +0100
Subject: [Buildroot] [PATCHv2] openssh: add systemd unit file
In-Reply-To: <1384866556-15715-1-git-send-email-gustavo@zacarias.com.ar>
References: <1384866556-15715-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20131119142058.72034f7e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 19 Nov 2013 10:09:16 -0300, Gustavo Zacarias wrote:
> And only install sysV-style script when appropiate.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/openssh/openssh.mk | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)

In this v2, you're no longer adding the systemd unit file.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
