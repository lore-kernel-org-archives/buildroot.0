From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 16:37:46 +0200
Subject: [Buildroot] [PATCH 1/1] python-pygame: remove python dependency
In-Reply-To: <1432797724-5329-1-git-send-email-pbouda@cidles.eu>
References: <1432797724-5329-1-git-send-email-pbouda@cidles.eu>
Message-ID: <20150711163746.573c690b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Bouda,

On Thu, 28 May 2015 08:22:04 +0100, Peter Bouda wrote:
> With the dependency on BR2_PACKAGE_PYTHON it was only possible to
> build the package with python2. However, python-pygame works with
> python3 so enable it to be built with it.
> 
> Signed-off-by: Peter Bouda <pbouda@cidles.eu>
> ---
>  package/python-pygame/Config.in | 1 -
>  1 file changed, 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
