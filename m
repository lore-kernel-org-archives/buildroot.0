From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Apr 2015 10:07:57 +0200
Subject: [Buildroot] [PATCH] ruby: security bump to version 2.2.2
In-Reply-To: <1428958469-19720-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428958469-19720-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150414100757.62ea08a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 13 Apr 2015 17:54:29 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2015-1855 - OpenSSL extension?s hostname verification vulnerability.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/ruby/ruby.hash | 4 ++--
>  package/ruby/ruby.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
