From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 21:52:42 +0100
Subject: [Buildroot] [PATCH v4 4/5] Enable xpdf-headers in poppler to
 enable building of cups-filters
In-Reply-To: <1453328267-31962-5-git-send-email-olivier.schonken@gmail.com>
References: <1453328267-31962-1-git-send-email-olivier.schonken@gmail.com>
 <1453328267-31962-5-git-send-email-olivier.schonken@gmail.com>
Message-ID: <20160221215242.682c38b0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Olivier Schonken,

On Thu, 21 Jan 2016 00:17:46 +0200, Olivier Schonken wrote:
> Add --enable-xpdf-headers to poppler.mk. Required for succesfull
> build of cups-filters.
> 
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> Reviewed-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/poppler/poppler.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

The title of all commits touching packages should have the following
form:

	<package>: <what happens>

So, I've changed the commit title of this patch to:

	poppler: install xpdf-headers to enable building of cups-filters

Applied to next with this change, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
