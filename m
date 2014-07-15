From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 20:59:26 +0200
Subject: [Buildroot] [PATCH] dependencies.sh message: fix Debian renamed
 packages
In-Reply-To: <1404988617-10992-1-git-send-email-kaszak@gmail.com>
References: <1404988617-10992-1-git-send-email-kaszak@gmail.com>
Message-ID: <20140715205926.7b595c85@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Karoly Kasza,

On Thu, 10 Jul 2014 12:36:57 +0200, Karoly Kasza wrote:
> Debian renamed the 32bit compatibility packages.
> 
> Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> ---
>  support/dependencies/dependencies.sh |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

I've implemented Arnout's proposal and committed the patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
