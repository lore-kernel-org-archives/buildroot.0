From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Mar 2017 00:08:21 +0100
Subject: [Buildroot] [PATCH] package/rpi-userland: don't isntall file in
	random location
In-Reply-To: <1488921388-9691-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Tue, 7 Mar 2017 22:16:28 +0100")
References: <1488921388-9691-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <877f3sydui.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, rpi-userland installs files in $(@D)/../../bin/ which is
 > entirely stupid, especially in cross-compilation.

 > Get rid of the dubious, broken, custom install command.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
