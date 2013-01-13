From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 13 Jan 2013 22:45:17 +0100
Subject: [Buildroot] [PATCH 10/10] libqwt: new package
In-Reply-To: <655f8a8354c421c2c1147e56e4ed91ae6c12de81.1338653505.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 2 Jun 2012 18:14:00 +0200")
References: <cover.1338653505.git.thomas.petazzoni@free-electrons.com>
 <cover.1338653505.git.thomas.petazzoni@free-electrons.com>
 <655f8a8354c421c2c1147e56e4ed91ae6c12de81.1338653505.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87bocsvjte.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> From: Laurent GONZALEZ <br2@gezedo.com>
 Thomas> Patch initially written by Thomas Petazzoni, then reworked and updated
 Thomas> by Laurent Gonzalez, and finally cleaned up by Thomas again.

Committed with minor fixes to match BR changes, thanks.

 Thomas> diff --git a/package/libqwt/Config.in b/package/libqwt/Config.in
 Thomas> new file mode 100644
 Thomas> index 0000000..48b27ca
 Thomas> --- /dev/null
 Thomas> +++ b/package/libqwt/Config.in
 Thomas> @@ -0,0 +1,23 @@
 Thomas> +config BR2_PACKAGE_LIBQWT

I've dropped 'lib' and just called it BR2_PACKAGE_QWT. I've also moved
it up under qt and changed the QT_GUI_MODULE to a depends on similar to
qtuio.

-- 
Bye, Peter Korsgaard
