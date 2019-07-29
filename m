From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 29 Jul 2019 09:27:09 +0200
Subject: [Buildroot] [PATCH] package/zip: adjust the version to 3.0
In-Reply-To: <20190620134809.10007-1-thomas.petazzoni@bootlin.com>
References: <20190620134809.10007-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190729092709.3661757d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 20 Jun 2019 15:48:09 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> According to the project homepage at
> http://infozip.sourceforge.net/Zip.html, the version is really named
> 3.0. This is also how it's called inside the zip30.ann file in the
> source code, which says "We have posted Zip 3.0, July 5th 2008".
> 
> So the fact that the tarball is named zip30.tgz is just because
> upstream wanted to avoid having two dots (perhaps by habit of the old
> DOS 8.3 file name limitation ?).
> 
> The version is also named "3.0" in the SourceForge RSS at [0] that
> release-monitoring.org is using for this package [1]. Therefore, by
> using "3.0" as the version, we will match the version known by
> release-monitoring.org.
> 
> Of course the tarball name is still zip30.tgz so we tweak the
> ZIP_VERSION value appropriately.
> 
> [0] https://sourceforge.net/projects/infozip/rss?path=/
> [1] https://release-monitoring.org/project/10080/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/zip/zip.mk | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
