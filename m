From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Jun 2018 21:36:11 +0200
Subject: [Buildroot] [PATCH v3 5/5] package/gdb: remove 7.11
In-Reply-To: <20180624135310.16514-6-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 24 Jun 2018 15:53:10 +0200")
References: <20180624135310.16514-1-thomas.petazzoni@bootlin.com>
 <20180624135310.16514-6-thomas.petazzoni@bootlin.com>
Message-ID: <87sh5cdljo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > From: Romain Naour <romain.naour@gmail.com>
 > Now that 8.1 has been added and 8.0 is the default version, let's
 > remove the old 7.11 release.

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 >  Config.in.legacy           | 7 +++++++
 >  package/gdb/Config.in.host | 4 ----
 >  package/gdb/gdb.hash       | 1 -
 >  3 files changed, 7 insertions(+), 5 deletions(-)

 > diff --git a/Config.in.legacy b/Config.in.legacy
 > index e8aa4a557f..e87786129f 100644
 > --- a/Config.in.legacy
 > +++ b/Config.in.legacy
 > @@ -713,6 +713,13 @@ config BR2_PACKAGE_KODI_ADSP_FREESURROUND
 >  ###############################################################################
 >  comment "Legacy options removed in 2018.02"
 
 > +config BR2_GDB_VERSION_7_11

Same comment as for 7.10. Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
