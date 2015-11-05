From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Nov 2015 13:30:09 +0100
Subject: [Buildroot] [PATCH] python-protobuf: fix legal info
In-Reply-To: <1446720185-10790-1-git-send-email-gustavo@zacarias.com.ar>
References: <1446720185-10790-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151105133009.39cc06f3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu,  5 Nov 2015 07:43:05 -0300, Gustavo Zacarias wrote:
> It uses the same tarball as protobuf hence suffers the same problem as
> commit f700463c. Fixes:
> http://autobuild.buildroot.net/results/428/4282281e5582b0da8ed3ff44f4d6d86f716ea333/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/python-protobuf/python-protobuf.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
