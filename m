From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Nov 2017 23:24:04 +0100
Subject: [Buildroot] [PATCH] postgresql: security bump to version 9.6.6
In-Reply-To: <20171111104456.30603-1-peter@korsgaard.com>
References: <20171111104456.30603-1-peter@korsgaard.com>
Message-ID: <20171111232404.74f80592@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Nov 2017 11:44:56 +0100, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> CVE-2017-12172: Start scripts permit database administrator to modify
> root-owned files.
> 
> CVE-2017-15098: Memory disclosure in JSON functions.
> 
> CVE-2017-15099: INSERT ... ON CONFLICT DO UPDATE fails to enforce SELECT
> privileges.
> 
> See the announcement for more details:
> https://www.postgresql.org/about/news/1801/
> 
> While we're at it, also add a hash for the license file.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/postgresql/postgresql.hash | 6 ++++--
>  package/postgresql/postgresql.mk   | 2 +-
>  2 files changed, 5 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
