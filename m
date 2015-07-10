From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jul 2015 19:35:42 +0200
Subject: [Buildroot] [PATCH] ruby: enable parallel build
In-Reply-To: <1436547008-31236-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436547008-31236-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150710193542.630b0323@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 10 Jul 2015 13:50:08 -0300, Gustavo Zacarias wrote:
> Re-enable parallel builds, it doesn't seem to be affected by the issue
> worked around in 9332a1ad4 any more.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/ruby/ruby.mk | 1 -
>  1 file changed, 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
