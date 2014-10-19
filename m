From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 16:41:26 +0200
Subject: [Buildroot] [PATCH] cppdb: enable postgresql support
In-Reply-To: <1413555954-30435-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413555954-30435-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141019164126.646ba28b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 17 Oct 2014 11:25:54 -0300, Gustavo Zacarias wrote:
> Also:
> Fix mysql support.
> Add hash file.
> Forcibly disable automatic db support when it's not selected.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/cppdb/Config.in                            |  4 ++--
>  .../cppdb/cppdb-0001-mysql-library-suffix.patch    | 23 ++++++++++++++++++++++
>  package/cppdb/cppdb.hash                           |  3 +++
>  package/cppdb/cppdb.mk                             | 13 +++++++++++-
>  4 files changed, 40 insertions(+), 3 deletions(-)
>  create mode 100644 package/cppdb/cppdb-0001-mysql-library-suffix.patch
>  create mode 100644 package/cppdb/cppdb.hash

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
