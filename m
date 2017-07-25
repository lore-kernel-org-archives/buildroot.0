From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 22:05:24 +0200
Subject: [Buildroot] [PATCH v2] nginx-upload-module: add openssl lib
 dependency
In-Reply-To: <1500820257-33827-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1500820257-33827-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20170725220524.409c7eed@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Jul 2017 09:30:57 -0500, Matt Weber wrote:
> When building against nginx 1.11.2+, requires additional
> -lcrypto dependency. (Nginx changed crypto approach
> and dependencies for openssl are no longer default)
> 
> Upstream pull request:
> https://github.com/vkholodkov/nginx-upload-module/pull/93
> 
> Fixes:
> http://autobuild.buildroot.net/results/e25f8ba8d8743e47a77707cf582e58477e1860e6
> http://autobuild.buildroot.net/results/c4aa6e22033be934bd311cd9761f646d44618dc0
> http://autobuild.buildroot.net/results/75e935d248b46df11c32c95526423a2287ac8c62
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> 
> ---
> v1->v2
> [Arnout
>  - Regenerated patch without endline change and format-patch -N
>  - Updated openssl lib dependency to use pkg-config similar to
>    package/nginx/0006-auto-lib-openssl-conf-use-pkg-config.patch
> ---
>  ...-upload-module-add-openssl-lib-dependency.patch | 56 ++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 package/nginx-upload/0001-nginx-upload-module-add-openssl-lib-dependency.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
