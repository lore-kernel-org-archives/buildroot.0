From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 23:40:57 +0200
Subject: [Buildroot] [PATCH] give a hint about git rebase
In-Reply-To: <1398799827-13701-1-git-send-email-wbx@openadk.org>
References: <1398799827-13701-1-git-send-email-wbx@openadk.org>
Message-ID: <20140715234057.0da65c88@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Tue, 29 Apr 2014 21:30:27 +0200, Waldemar Brodkorb wrote:
> It seems common knowledge to use git rebase in interactive mode
> to fixup issues while respinning patch series, but I found it hard
> to find any hint about it. Add a note for git beginners like me.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  docs/manual/contribute.txt |    2 ++
>  1 file changed, 2 insertions(+)

Applied after taking into account Arnout's comment. Next time, please
use a better commit title such as:

	docs/manual: give a hint about git rebase

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
