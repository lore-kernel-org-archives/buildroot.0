From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 21:49:00 +0200
Subject: [Buildroot] [PATCH] subversion: security bump to version 1.9.7
In-Reply-To: <20170906154039.21569-1-peter@korsgaard.com>
References: <20170906154039.21569-1-peter@korsgaard.com>
Message-ID: <20170906214900.33c989d5@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  6 Sep 2017 17:40:39 +0200, Peter Korsgaard wrote:
> Fixes CVE-2017-9800: Arbitrary code execution on clients through malicious
> svn+ssh URLs in svn:externals and svn:sync-from-url
> 
> For more details, see
> http://subversion.apache.org/security/CVE-2017-9800-advisory.txt
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/subversion/subversion.hash | 7 +++----
>  package/subversion/subversion.mk   | 2 +-
>  2 files changed, 4 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
