From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 17:17:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/libldns: Fix build error with
 perl 5.10
In-Reply-To: <1458924359-27561-1-git-send-email-bernd.kuhls@t-online.de>
References: <1458924359-27561-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160329171756.0ca6a061@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 25 Mar 2016 17:45:59 +0100, Bernd Kuhls wrote:
> Add more upstream commits to fix build errors with perl 5.10
> introduced by the previous patch to fix build errors with perl 5.22.
> 
> Fixes
> http://autobuild.buildroot.net/results/325/32519c6d4084f334b7fed9edfb8a8c68a1f840a8/
> and many others
> 
> Please note that switching to the upstream branch 'develop' will
> introduce new build errors when dane support is disabled.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libldns/0004-doxyparse.patch |  33 +++
>  package/libldns/0005-doxyparse.patch | 431 +++++++++++++++++++++++++++++++++++
>  2 files changed, 464 insertions(+)
>  create mode 100644 package/libldns/0004-doxyparse.patch
>  create mode 100644 package/libldns/0005-doxyparse.patch

I've applied, after regenerating the patches from the Git repository,
to avoid the e-mail issue caused by the too long lines. I also added a
previous commit that reformatted the previous patches with Git.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
