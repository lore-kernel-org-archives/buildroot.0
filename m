From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 23:08:14 +0100
Subject: [Buildroot] [PATCH 1/2] pcre: enable unicode properties for
 host variant
In-Reply-To: <1458682681-29918-1-git-send-email-gustavo@zacarias.com.ar>
References: <1458682681-29918-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160322230814.0595d148@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Mar 2016 18:38:00 -0300, Gustavo Zacarias wrote:
> They're required for host-libglib2 and using system pcre is the
> default/recommended with newer versions.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/pcre/pcre.mk | 3 +++
>  1 file changed, 3 insertions(+)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
