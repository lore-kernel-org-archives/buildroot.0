From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Feb 2016 21:37:47 +0100
Subject: [Buildroot] [PATCH] postgresql: security bump to version 9.4.6
In-Reply-To: <1455638558-1805-1-git-send-email-gustavo@zacarias.com.ar>
References: <1455638558-1805-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160216213747.223c9fd2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 16 Feb 2016 13:02:38 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2016-0766 - privilege escalation issue for users of PL/Java.
> CVE-2016-0773 - issue with regular expression (regex) parsing. Prior
> code allowed users to pass in expressions which included out-of-range
> Unicode characters, triggering a backend crash. This issue is critical
> for PostgreSQL systems with untrusted users or which generate regexes
> based on user input.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/postgresql/postgresql.hash | 4 ++--
>  package/postgresql/postgresql.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
