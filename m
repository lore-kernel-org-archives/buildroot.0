From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 22:16:27 +0100
Subject: [Buildroot] [PATCH] icu: remove dev files
In-Reply-To: <1457540722-19623-1-git-send-email-gustavo@zacarias.com.ar>
References: <1457540722-19623-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160320221627.22d0cb0d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  9 Mar 2016 13:25:22 -0300, Gustavo Zacarias wrote:
> Remove files that aren't used for runtime purposes.
> 
> Size savings delta +450 KB.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/icu/icu.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
