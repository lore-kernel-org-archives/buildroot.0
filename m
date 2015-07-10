From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 00:58:26 +0200
Subject: [Buildroot] [PATCH 5/7 v2] busybox: adjust configuration to add
 fancy options to the sleep applet
In-Reply-To: <1436458921-4199-6-git-send-email-sylvain.raybaud@green-communications.fr>
References: <1436458921-4199-1-git-send-email-sylvain.raybaud@green-communications.fr>
 <1436458921-4199-6-git-send-email-sylvain.raybaud@green-communications.fr>
Message-ID: <20150711005826.77335517@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sylvain Raybaud,

On Thu,  9 Jul 2015 18:21:59 +0200, Sylvain Raybaud wrote:
> Set CONFIGURE_FEATURE_FANCY_SLEEP and CONFIG_FEATURE_FLOAT_SLEEP so that sleep accept floating point arguments.
> This add 492 bytes to the busybox binary compiled for arm or 2748 bytes when compiled for i386.
> 
> Signed-off-by: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
> ---
> Changes v1 -> v2:
>  - Add information about the impact on busybox binary size induced by patching busybox.config (suggested by Thomas Petazzoni)

Applied, thanks.

Next time, can you remember to wrap your commit log to ~72 columns?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
