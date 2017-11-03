From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Nov 2017 21:57:16 +0100
Subject: [Buildroot] [PATCH] moarvm: use host-lua instead of host-luajit
In-Reply-To: <20171103155140.1790-1-peter@korsgaard.com>
References: <20171103155140.1790-1-peter@korsgaard.com>
Message-ID: <20171103215716.0426b87e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  3 Nov 2017 16:51:40 +0100, Peter Korsgaard wrote:
> host-luajit has limited architecture support, and moarvm does not need
> anything luajit specific - So use host-lua instead.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/moarvm/moarvm.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
