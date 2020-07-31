From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Jul 2020 09:15:15 +0200
Subject: [Buildroot] [PATCH v4, 1/1] package/zbar: bump to version 0.23.1
In-Reply-To: <20200728101909.2723100-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 28 Jul 2020 12:19:09 +0200")
References: <20200728101909.2723100-1-fontaine.fabrice@gmail.com>
Message-ID: <87v9i49mv0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Add new NLS dependency as well as a patch to fix a build failure
 >   without it
 > - Drop host-gettext (not needed since autoreconf was dropped with
 >   8729c4ef881b02ff85b7645b0ad309d6ae44fccf)
 > - Update indentation in hash file (two spaces)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v3 -> v4 (after review of Yann E. Morin):
 >  - Report license issue about gettext.h and retrieve upstream patch:
 >    https://github.com/mchehab/zbar/issues/98

 > Changes v2 -> v3 (after review of Thomas Petazzoni):
 >  - Drop host-gettext dependency

 > Changes v1 -> v2:
 >  - Correctly pass TARGET_NLS_LIBS to ZBAR_CONF_ENV

Committed, thanks.

-- 
Bye, Peter Korsgaard
