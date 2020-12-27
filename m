From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 09:46:24 +0100
Subject: [Buildroot] [PATCH] package/opencv3: do not detect ccache
In-Reply-To: <20201226154729.2507761-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 26 Dec 2020 16:47:29 +0100")
References: <20201226154729.2507761-1-yann.morin.1998@free.fr>
Message-ID: <87lfdjbpr3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > OpenCV-3's buildsystem will try to detect ccache and use it if
 > available. This may yield a system-installed ccache.

 > However, in Buildroot, ccache is entirely hidden away and handled in the
 > toolchain wrapper.

 > Forcibly disable detection of ccache.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Cc: Samuel Martin <s.martin49@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
