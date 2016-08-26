From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 11:09:44 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/libgpg-error: optionally
 depends on gettext
In-Reply-To: <20160825201336.6751-1-arnout@mind.be>
References: <20160825201336.6751-1-arnout@mind.be>
Message-ID: <20160826110944.41857933@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 Aug 2016 22:13:35 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> configure.ac has AM_GNU_GETTEXT(), which will enable i18n if a gettext
> library is found. For uClibc, it is found if the gettext package has
> been built, and it will add -lintl to the link flags. For musl and
> glibc, it is always found, in libc itself so nothing is added to the
> link flags.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Matthew Weber <matt@thewebers.ws>
> ---
> Discovered while investigating
> http://autobuild.buildroot.net/results/f81/f81eabb37788aa6dcdadf4034889c84bef78b876/

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
