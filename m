From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Mar 2017 14:53:11 +0100
Subject: [Buildroot] [PATCH] upmpdcli: add user to the audio group
In-Reply-To: <20170324084743.1233-1-joerg.krause@embedded.rocks>
References: <20170324084743.1233-1-joerg.krause@embedded.rocks>
Message-ID: <20170325145311.34ed3842@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Mar 2017 09:47:43 +0100, J?rg Krause wrote:
> upmpdcli runs as user and group upmpdcli. In order to allow it to access
> the ALSA devices add it to the audio group.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/upmpdcli/upmpdcli.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
