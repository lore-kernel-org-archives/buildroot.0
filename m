From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Feb 2016 18:19:20 +0100
Subject: [Buildroot] [PATCH 1/2] samba4: add optional libbsd dependency
In-Reply-To: <1455287902-12495-1-git-send-email-gustavo@zacarias.com.ar>
References: <1455287902-12495-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160213181920.7a76c50e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 12 Feb 2016 11:38:21 -0300, Gustavo Zacarias wrote:
> It's used for some small functions like md5 support, non-essential since
> samba has an internal fallback for those, but still add it for
> predictability.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/samba4/samba4.mk | 1 +
>  1 file changed, 1 insertion(+)

Both applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
