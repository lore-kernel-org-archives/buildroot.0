From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Jan 2015 13:23:26 +0100
Subject: [Buildroot] [PATCH] package/kodi: add missing dependency on
	libdrm
In-Reply-To: <1421622810-6318-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Mon, 19 Jan 2015 00:13:30 +0100")
References: <1421622810-6318-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87sif79cxt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When building Kodi with X11 support, libdrm is a mandatory dependency,
 > and it uses pkg-config to find it.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
