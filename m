From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 09:43:49 +0200
Subject: [Buildroot] [PATCH] package/make: fix hash type (md5 instead of
 sha1)
In-Reply-To: <1464892503-32325-1-git-send-email-jcmvbkbc@gmail.com>
References: <1464892503-32325-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20160603094349.0570cda9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  2 Jun 2016 21:35:03 +0300, Max Filippov wrote:
> Fixes:
>   http://autobuild.buildroot.net/results/133cdeaa0644405568c3e8fc003d73c4570fbc82/
>   http://autobuild.buildroot.net/results/e162f46458f4948c75550d47710bee92f1602273/
>   http://autobuild.buildroot.net/results/7ca74c9ea36321e1940ee2707af5745b7d4498d2/
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  package/make/make.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
