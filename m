From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Feb 2018 21:29:43 +0100
Subject: [Buildroot] [PATCH 1/1] Add first KF5 packages
In-Reply-To: <hrvclexdar.ln2@ID-313208.user.individual.net>
References: <20180213213531.22910-1-pinaraf@pinaraf.info>
 <hrvclexdar.ln2@ID-313208.user.individual.net>
Message-ID: <20180214212943.3aa126a5@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 14 Feb 2018 06:59:45 +0100, Bernd Kuhls wrote:

> according to the buildroot manual[1], section 17.1, new subdirectories, 
> like package/kf5/, are discouraged, please add the new packages directly 
> to package/.

I do agree in general. However, kf5 like qt5 is a group of packages
that share the same site/version number, and in that case, like we do
for qt5, a subdirectory is acceptable.

I'm also not a big fan of sub-directories, but it's the only sane way
to share version/site variables.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
