From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Feb 2014 17:03:09 +0100
Subject: [Buildroot] [pkg-perl infra V4 6/9] perl: remove useless patch
In-Reply-To: <1391608380-23240-7-git-send-email-francois.perrad@gadz.org>
References: <1391608380-23240-1-git-send-email-francois.perrad@gadz.org>
 <1391608380-23240-7-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140205170309.3a7da08e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Wed,  5 Feb 2014 14:52:57 +0100, Francois Perrad wrote:
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/perl/perl-fix-Module-Build.patch |   16 ----------------
>  1 file changed, 16 deletions(-)
>  delete mode 100644 package/perl/perl-fix-Module-Build.patch

It would be good to indicate in the commit log why the patch was
useless.

Sorry to bother you so much about commit logs, but they are *really*
important. I can't tell you the number of times I look at the git
commit logs in the history of Buildroot to understand why such or such
choice was made. So I really want to have good commit logs, and a
commit log such as "remove useless patch" is not a good commit log, as
it doesn't explain *why* the change was made.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
