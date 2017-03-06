From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Mar 2017 17:48:09 +0100
Subject: [Buildroot] [PATCH] pango: bump to version 1.40.4
In-Reply-To: <20170306145904.4784-1-gustavo@zacarias.com.ar>
References: <20170306145904.4784-1-gustavo@zacarias.com.ar>
Message-ID: <20170306174809.56a6a314@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Mar 2017 11:59:04 -0300, Gustavo Zacarias wrote:
> Update test-disabling patch for new version, and git format it.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../0001-build-disable-tests-from-building.patch   | 39 ++++++++++++++++++++++
>  package/pango/0001-no-tests.patch                  | 30 -----------------
>  package/pango/pango.hash                           |  4 +--
>  package/pango/pango.mk                             |  2 +-
>  4 files changed, 42 insertions(+), 33 deletions(-)
>  create mode 100644 package/pango/0001-build-disable-tests-from-building.patch
>  delete mode 100644 package/pango/0001-no-tests.patch

Applied to master, thanks. However, could you improve the test
disabling patch to introduce a --disable-tests option and send it
upstream? It'd be nice to be able to get rid of this patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
