From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Mar 2019 21:36:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/cutelyst: bump to version 2.7.0
In-Reply-To: <20190304064635.6819-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 4 Mar 2019 07:46:35 +0100")
References: <20190304064635.6819-1-fontaine.fabrice@gmail.com>
Message-ID: <875zsyidh7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit c110e48cecde6f543da18388322907b05b25e7d2 disabled openssl support
 > on QT 5.6, this has the side-effect of breaking the build of cutelyst
 > because cutelyst does not manage build with QT_NO_SSL, see:
 > https://github.com/cutelyst/cutelyst/issues/159

 > This bump fixes the issue by bumping cutelyst to version 2.7.0 and by
 > removing the uneeded select on BR2_PACKAGE_OPENSSL

 > Fixes:
 >  - http://autobuild.buildroot.org/results/4299221429713ace25fc234abeb81697bc410647

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
