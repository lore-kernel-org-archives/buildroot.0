From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 10:02:41 +0200
Subject: [Buildroot] [PATCH] lighttpd: run as non-privileged user
 www-data
In-Reply-To: <1430410336-8292-1-git-send-email-bos@je-eigen-domein.nl>
References: <1430410336-8292-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20150501100241.631b89e5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Thu, 30 Apr 2015 18:12:16 +0200, Floris Bos wrote:
> Previously the stock lighttpd configuration was patched to run as user root,
> because we do not have a lighttpd user.
> Patch it to use www-data instead, which is a user available in the default
> skeleton, and is the same other webserver packages (like nginx) use.
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> ---
>  package/lighttpd/0001-Fix-default-config-file.patch | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
