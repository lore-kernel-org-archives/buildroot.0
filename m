From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jun 2015 21:30:43 +0200
Subject: [Buildroot] [PATCH 1/2] python-pyxml: rename the package file
In-Reply-To: <1434088845-2806-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1434088845-2806-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <20150612213043.51a0e64e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jerzy Grzegorek,

On Fri, 12 Jun 2015 08:00:44 +0200, Jerzy Grzegorek wrote:
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
> ---
>  package/python-pyxml/{python-xml.hash => python-pyxml.hash} | 0
>  package/python-pyxml/{python-xml.mk => python-pyxml.mk}     | 0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename package/python-pyxml/{python-xml.hash => python-pyxml.hash} (100%)
>  rename package/python-pyxml/{python-xml.mk => python-pyxml.mk} (100%)

Applied, thanks. This is actually a real bug fix, because until now,
the hash file was simply ignored.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
