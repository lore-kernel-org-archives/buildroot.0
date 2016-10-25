From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 12:45:16 +0200
Subject: [Buildroot] [RFC PATCH] scripts/get-developers: correct type of
 patches argument
In-Reply-To: <1474484355-18864-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1474484355-18864-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20161025124516.6be5db94@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Sep 2016 00:29:14 +0530, Rahul Bedarkar wrote:
> Current type for 'patches' argument is str. It supposed to only
> contain names of files.
> 
> If we specify FileType as type, then we don't need to open file ourself
> and it allows script to read patch from standard input as well.
> 
> e.g.
> $ git show -1 | ./support/scripts/get-developers -
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  support/scripts/get-developers     |  4 ++--
>  support/scripts/getdeveloperlib.py | 25 ++++++++++++-------------
>  2 files changed, 14 insertions(+), 15 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
