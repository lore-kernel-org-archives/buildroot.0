From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Dec 2015 16:36:09 +0100
Subject: [Buildroot] [PATCH] rsync: security bump to version 3.1.2
In-Reply-To: <1450781171-19849-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450781171-19849-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151222163609.6b70501f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 22 Dec 2015 07:46:11 -0300, Gustavo Zacarias wrote:
> Fixes:
> Make sure that all transferred files use only path names from inside the
> transfer.  This makes it impossible for a malicious sender to try to
> make the receiver use an unsafe destination path for a transferred file,
> such as a just-sent symlink.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/rsync/rsync.hash | 2 +-
>  package/rsync/rsync.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
