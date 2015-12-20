From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 13:45:40 +0100
Subject: [Buildroot] [PATCH v2] xutil_util-macros: move outside x11r7
 scope
In-Reply-To: <1450612688-10698-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450612688-10698-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151220134540.4e006599@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun, 20 Dec 2015 08:58:08 -0300, Gustavo Zacarias wrote:
> Move to baseline package/
> It doesn't really require x11r7 infrastructure and is in fact needed by
> libepoxy which can be made x11r7-less.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
> v2: keep the name, as recommended by Arnout

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
