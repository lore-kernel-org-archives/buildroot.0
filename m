From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Apr 2015 22:28:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/perl-libwww: Fix legal-info
In-Reply-To: <1429551651-21509-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429551651-21509-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150420222857.7d538271@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Mon, 20 Apr 2015 19:40:51 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/6c6/6c6fb6001101ff528176b887ed8c95ef49313afb/
> http://autobuild.buildroot.net/results/56d/56d42e7691d4eb1a682c49c0fa6c951d0e3069ec/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/perl-libwww/perl-libwww.mk |    1 -
>  1 file changed, 1 deletion(-)

Actually, there's a README file that contains a copyright notice and
the name of the license, so I've used that as the license file instead
of not having anything.

And I've removed the hash file, as reported by Romain Naour.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
