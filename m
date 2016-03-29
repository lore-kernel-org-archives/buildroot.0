From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 03:01:50 +0200
Subject: [Buildroot] [PATCH] configs/qemu: enable modules for x86 and
 x86_64
In-Reply-To: <1459199038-26889-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459199038-26889-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160329030150.24a9a627@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Mar 2016 18:03:58 -0300, Gustavo Zacarias wrote:
> It's useful for demo configs which have more features, like
> automatically loaded (module) drivers.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  board/qemu/x86/linux-4.5.config    | 2 ++
>  board/qemu/x86_64/linux-4.5.config | 2 ++
>  2 files changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
