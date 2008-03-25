From: Christian SCHWARZ <christian.schwarz@st.com>
Date: Tue, 25 Mar 2008 14:36:14 +0100
Subject: [Buildroot] Glib2 build problem
Message-ID: <47E8FFCE.8090706@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

I encounter a build problem with glib2 for an ARM11 target. The error 
message is the following:

---------------snip---------------------
[...]
checking libintl.h usability... yes
checking libintl.h presence... yes
checking for libintl.h... yes
checking for ngettext in libc... no
checking for bindtextdomain in -lintl... no
checking if -liconv is needed to use gettext...
checking for ngettext in -lintl... no
configure: error:
*** You must have either have gettext support in your C library, or use the
*** GNU gettext library. (http://www.gnu.org/software/gettext/gettext.html
---------------------snap-------------------------------------

It seems as though I should configure ngettext support in libintl, but I 
don't know how to do so. Is the alternative rebuilding the uclibc, 
similar to what has been discussed on the mailing list?:
http://www.nabble.com/Kindly-help-me-to-build-glib2-on-arm926-platform-td12012803.html

Buildroot snapshot is 2008-17-03. A cross-compiling toolchain for ARM 
Linux has been built (previously) with buildroot.

thanks for any hints,
Christian
