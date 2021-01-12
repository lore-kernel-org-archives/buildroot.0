From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jan 2021 18:22:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/multipath-tools: fix license
In-Reply-To: <20210110085951.699900-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 10 Jan 2021 09:59:51 +0100")
References: <20210110085951.699900-1-fontaine.fabrice@gmail.com>
Message-ID: <878s8ym5n9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > As stated in README.md, multipath-tools is covered by several licenses
 > and LGPL-2.0 is "just" the default license:
 >  - GPL-2.0+ (e.g. libmultipath/alias.c)
 >  - GPL-3.0+ (e.g. libdmmp/libdmmp.c)
 >  - LGPL-2.1+ (e.g. libmpathcmd/mpath_cmd.c)

 > So replace COPYING (which is a symlink to LICENSES/LGPL-2.0) by the
 > approriate license files in LICENSES directory

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
