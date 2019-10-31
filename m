From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 22:46:07 +0100
Subject: [Buildroot] [PATCH 1/2] package/minizip: select libiconv if
 needed
In-Reply-To: <20191029085938.10595-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 29 Oct 2019 09:59:37 +0100")
References: <20191029085938.10595-1-fontaine.fabrice@gmail.com>
Message-ID: <87ftj84mhs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > iconv.h is always included by mz_os_posix.c so select
 > BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE

 > Fixes:
 >  - No autobuilder failures

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
