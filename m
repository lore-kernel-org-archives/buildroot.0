From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jan 2018 14:07:47 +0100
Subject: [Buildroot] [PATCH] bind: security bump to version 9.11.2-P1
In-Reply-To: <20180117074243.31352-1-peter@korsgaard.com>
References: <20180117074243.31352-1-peter@korsgaard.com>
Message-ID: <20180117140747.42730508@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 Jan 2018 08:42:43 +0100, Peter Korsgaard wrote:
> Fixes the following security issue:
> 
> CVE-2017-3145: Improper sequencing during cleanup can lead to a
> use-after-free error, triggering an assertion failure and crash in
> named.
> 
> For more details, see the advisory:
> https://lists.isc.org/pipermail/bind-announce/2018-January/001072.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/bind/bind.hash | 4 ++--
>  package/bind/bind.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
