From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 14 Feb 2018 06:59:45 +0100
Subject: [Buildroot] [PATCH 1/1] Add first KF5 packages
References: <20180213213531.22910-1-pinaraf@pinaraf.info>
Message-ID: <hrvclexdar.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 13 Feb 2018 22:35:31 +0100 schrieb Pierre Ducroquet:

> This first commit introduce the kf5 packages folder and the first two
> KF5 packages:

Hi Pierre,

according to the buildroot manual[1], section 17.1, new subdirectories, 
like package/kf5/, are discouraged, please add the new packages directly 
to package/.

Regards, Bernd

[1] https://buildroot.uclibc.org/downloads/manual/manual.html#adding-
packages
