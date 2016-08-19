From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 15:53:31 +0200
Subject: [Buildroot] [PATCH v2] python-requests-toolbelt: new package
In-Reply-To: <20160819124802.6793-1-develop@manuel-voegele.de>
References: <20160819124802.6793-1-develop@manuel-voegele.de>
Message-ID: <20160819155331.4b9c3f22@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 Aug 2016 14:48:02 +0200, Manuel V?gele wrote:
> Signed-off-by: Manuel V?gele <develop@manuel-voegele.de>
> ---
> Changes v1 -> v2:
>   - Regenerated package using scanpypi which had the following effects
>     - select BR2_PACKAGE_PYTHON_REQUESTS instead of depends on
>     - moved the checksum comments into a single line
>     - removed build-time dependency to python-requests

Applied to next, thanks. Thanks Yegor for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
