From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 12 Jan 2013 22:34:51 +0100
Subject: [Buildroot] [PATCH 08/28] x11r7: do not globally select
	libraries
In-Reply-To: <d72dbd3289911f78a4e38a783cbddafd3cfd5fef.1357507764.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 6 Jan 2013 22:29:20 +0100")
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <d72dbd3289911f78a4e38a783cbddafd3cfd5fef.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87k3ri3x1g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> It doesn't make sense for BR2_PACKAGE_XORG7 to globally select
 Thomas> libraries such as libpng, zlib, expat or fontconfig. For example, if
 Thomas> you do a build with just xlib_libX11, then libpng gets built as the
 Thomas> last package, without anybody actually depending on it, even if it was
 Thomas> selected by BR2_PACKAGE_XORG7.

Committed, thanks.

-- 
Bye, Peter Korsgaard
