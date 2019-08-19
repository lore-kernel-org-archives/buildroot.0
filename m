From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Aug 2019 23:52:05 +0200
Subject: [Buildroot] [PATCH/next v2,
 2/2] package/giflib: bump to version 5.2.1
In-Reply-To: <20190819212121.30089-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 19 Aug 2019 23:21:21 +0200")
References: <20190819212121.30089-1-fontaine.fabrice@gmail.com>
 <20190819212121.30089-2-fontaine.fabrice@gmail.com>
Message-ID: <878srog6wq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Switch to generic-package (autotools has been dropped since version
 >   5.1.5)
 > - Remove hook and instead use dedicated makefile targets to build only
 >   shared or static library and not binaries or documentation (added by
 >   an upstreamble patch)
 > - ac_cv_prog_have_xmlto=no can be removed as doc is not built anymore

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Thomas Petazzoni):
 >  - Split CVE patches in a dedicated patch for master, bump is for next

Committed to next after cherry picking patch 1/2, thanks.

-- 
Bye, Peter Korsgaard
