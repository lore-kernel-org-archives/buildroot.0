From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Aug 2019 23:47:38 +0200
Subject: [Buildroot] [PATCH v2, 1/1] package/libssh2: switch site to
 https://www.libssh2.org/download
In-Reply-To: <20190819203645.22366-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 19 Aug 2019 22:36:45 +0200")
References: <20190819203645.22366-1-fontaine.fabrice@gmail.com>
Message-ID: <87h86cg745.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > As spotted by Danomi during review of "libssh2: security bump to version
 > 1.9.0" (https://patchwork.ozlabs.org/patch/1148776), it seems that
 > the tarball from github and libssh2.org/download are not the same. One
 > of the difference is that LIBSSH2_VERSION in include/libssh2.h is set to
 > "1.9.0_DEV" in github tarball whereas it is set to "1.9.0" in
 > libssh2.org/download.

 > So switch site to https://www.libssh2.org/download to get "official"
 > release

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > PS : This patch is for master

 > Changes v1 -> v2 (after review of Thomas Petazzoni):
 >  - Update commit message

Committed, thanks.

I will remove the "wrong" tarball from sources.buildroot.org as well.

-- 
Bye, Peter Korsgaard
