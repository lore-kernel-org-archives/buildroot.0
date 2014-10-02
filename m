From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Oct 2014 12:15:05 +0200
Subject: [Buildroot] [PATCH 1/2] ruby: use --disable-rubygems
In-Reply-To: <1412203197-1167-1-git-send-email-gustavo@zacarias.com.ar>
References: <1412203197-1167-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141002121505.2bd8b227@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed,  1 Oct 2014 19:39:56 -0300, Gustavo Zacarias wrote:
> At least for ruby 2.x we need to --disable-rubygems besides removing the
> gems files to avoid the requires.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/ruby/ruby.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
