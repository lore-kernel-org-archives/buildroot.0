From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 24 Oct 2019 22:25:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnetconf2: fixup the 'v'
 prefix in the version
In-Reply-To: <20191024180653.13243-1-fontaine.fabrice@gmail.com>
References: <20191024180653.13243-1-fontaine.fabrice@gmail.com>
Message-ID: <20191024222536.0032411f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 24 Oct 2019 20:06:53 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> In order for the luvi version to match what is given by
> release-monitoring.org, the 'v' prefix should be encoded in
> LIBNETCONF2_SITE and not LIBNETCONF2_VERSION.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Sorry for missing this when reviewing/applying those packages.

Perhaps it would make sense to add a check in the check-package logic,
to verify that the version doesn't look like vX.Y.Z ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
