From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 18:54:49 +0100
Subject: [Buildroot] [PATCH] boost: ignore site config
In-Reply-To: <1414493351-10954-1-git-send-email-gustavo@zacarias.com.ar>
References: <1414493351-10954-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141028185449.3a2cecb4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 28 Oct 2014 07:49:11 -0300, Gustavo Zacarias wrote:
> It can lead to build failures if you've got boost installed in the host,
> like this:
> http://stackoverflow.com/questions/23013433/how-to-install-modular-boost
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/boost/boost.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
