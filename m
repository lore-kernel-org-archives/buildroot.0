From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Sep 2015 22:34:43 +0200
Subject: [Buildroot] [PATCH v2] Enable vlc to run as root
In-Reply-To: <712f10f4f1eb6452279b88cb749906e66f711d8a.1442391509.git.jpinto@synopsys.com>
References: <712f10f4f1eb6452279b88cb749906e66f711d8a.1442391509.git.jpinto@synopsys.com>
Message-ID: <20150916223443.0101b320@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Sep 2015 09:26:49 +0100, jpinto wrote:
> From: Joao Pinto <jpinto@synopsys.com>
> 
> A great number of embedded systems only include the root user.
> This patch has the goal of enabling vlc to be ran as root.
> 
> Signed-off-by: Joao Pinto <jpinto@synopsys.com>
> Tested-by: Joao Pinto <jpinto@synopsys.com>
> ---
>  package/vlc/vlc.mk | 1 +
>  1 file changed, 1 insertion(+)

Thanks, I've applied after tweaking the commit.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
