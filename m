From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 23:13:28 +0100
Subject: [Buildroot] [PATCH] perl-gd: fix build of native part
In-Reply-To: <1487144532-1818-1-git-send-email-francois.perrad@gadz.org>
References: <1487144532-1818-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20170301231328.26100366@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Feb 2017 08:42:12 +0100, Francois Perrad wrote:
> EUMM don't find .xs file in subdirectory (only .pm files are handled)
> So, let move lib/GD.xs in the root directory.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/perl-gd/perl-gd.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks. Peter, I believe this one should go to the
LTS branch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
