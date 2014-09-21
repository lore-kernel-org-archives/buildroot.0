From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 22:46:05 +0200
Subject: [Buildroot] [PATCH 1/1] Removed X depency for make build-graphs
In-Reply-To: <1411317986-793-1-git-send-email-sascha.arthur@gmail.com>
References: <1411317986-793-1-git-send-email-sascha.arthur@gmail.com>
Message-ID: <20140921224605.22a4062f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sascha Arthur,

On Sun, 21 Sep 2014 18:46:26 +0200, Sascha Arthur wrote:
> 
> Signed-off-by: Sascha Arthur <sascha.arthur@gmail.com>
> ---
>  support/scripts/graph-build-time |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Thanks, I've applied the patch after tweaking the commit title. It
contained a typo: depency -> dependency. And also, it didn't contain a
prefix, as we typically do for all patches. So I changed the title to:

	scripts/graph-build-time: remove X dependency

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
