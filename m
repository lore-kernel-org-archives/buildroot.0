From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Aug 2014 22:29:31 +0200
Subject: [Buildroot] [PATCH] subversion: security bump to version 1.7.18
In-Reply-To: <1408127121-26398-1-git-send-email-gustavo@zacarias.com.ar>
References: <1408127121-26398-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140815222931.22d03b5b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 15 Aug 2014 15:25:21 -0300, Gustavo Zacarias wrote:
> Fixes:
> 
> CVE-2014-0032 - mod_dav_svn is vunerable to a remotely triggerable
> segfault DoS vulnerability when SVNListParentPath is on.
> 
> CVE-2014-3522 - Serf RA layer does not correctly validate certificates
> with wildcards in them for HTTPS.
> 
> CVE-2014-3528 - Credentials cached with Subversion may be sent to the
> wrong server.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/subversion/subversion.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
