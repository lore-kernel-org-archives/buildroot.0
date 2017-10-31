From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Oct 2017 11:57:29 +0100
Subject: [Buildroot] [PATCH 1/2] apr: security bump to version 1.6.3
In-Reply-To: <6c5b5801af6b7ce17eae8176827b0ce141a15c94.1509390662.git.baruch@tkos.co.il>
References: <6c5b5801af6b7ce17eae8176827b0ce141a15c94.1509390662.git.baruch@tkos.co.il>
Message-ID: <20171031115729.52e60dd5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 Oct 2017 21:11:01 +0200, Baruch Siach wrote:
> Fixes CVE-2017-12613: Out-of-bounds array deref in apr_time_exp*()
> functions.
> 
> Use upstream provided SHA256 hash.
> 
> Add license has.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/apr/apr.hash | 6 ++++--
>  package/apr/apr.mk   | 2 +-
>  2 files changed, 5 insertions(+), 3 deletions(-)

Both applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
