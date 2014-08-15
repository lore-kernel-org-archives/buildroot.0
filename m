From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Aug 2014 22:29:22 +0200
Subject: [Buildroot] [PATCH] gd: add patch for CVE-2014-2497
In-Reply-To: <1408125772-310-1-git-send-email-gustavo@zacarias.com.ar>
References: <1408125772-310-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140815222922.041dd8fe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 15 Aug 2014 15:02:52 -0300, Gustavo Zacarias wrote:
> Fixes CVE-2014-2497 - NULL pointer dereference
> Patch from upstream:
> https://bitbucket.org/libgd/gd-libgd/commits/463c3bd09bfe8e924e19acad7a2a6af16953a704
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gd/gd-04-CVE-2014-2497.patch | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/gd/gd-04-CVE-2014-2497.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
