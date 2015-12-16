From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2015 09:35:22 +0100
Subject: [Buildroot] [PATCH v3] gnutls: fix --disable-crywrap
In-Reply-To: <1450224303-20348-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450224303-20348-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151216093522.2a3014c6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 15 Dec 2015 21:05:03 -0300, Gustavo Zacarias wrote:
> Add a patch to really enable the --disable-crywrap option in gnutls.
> Fixes:
> http://autobuild.buildroot.org/results/d86/d8604fe448bb11395e8443726d09b041eb34c6d5/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
> v2: needs gettextize
> v3: say "applied"

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
