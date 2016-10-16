From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 18:15:20 +0200
Subject: [Buildroot] [PATCH 2/8] adwaita-icon-theme: install to staging
In-Reply-To: <1476321239-13894-2-git-send-email-gustavo@zacarias.com.ar>
References: <1476321239-13894-1-git-send-email-gustavo@zacarias.com.ar>
 <1476321239-13894-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20161016181520.4f8b4ea1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Oct 2016 22:13:53 -0300, Gustavo Zacarias wrote:
> This is required for the upcoming evince package.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/adwaita-icon-theme/adwaita-icon-theme.mk | 1 +
>  1 file changed, 1 insertion(+)

It feels a bit odd that evince needs icons in the staging directory.
Could you improve the commit message a bit to explain why this is
needed?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
