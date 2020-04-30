From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Apr 2020 14:15:40 +0200
Subject: [Buildroot] [git commit] package/jpeg: properly indent in
 menuconfig
In-Reply-To: <20200412131657.02FE08E6E3@busybox.osuosl.org> (Yann E. MORIN's
 message of "Sun, 12 Apr 2020 15:30:58 +0200")
References: <20200412131657.02FE08E6E3@busybox.osuosl.org>
Message-ID: <87bln96ufn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=7a48ac725f1829660641c348c062159d07519b45
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Since there is a variable definition between the definition of
 > BR2_PACKAGE_JPEG and the choice depending on it, the choice is
 > not indented bewlo the "jpeg support" prompt, like we like to
 > have:

 >     [*] jpeg support
 >         jpeg variant (jpeg-turbo)  --->

 > Move the BR2_PACKAGE_JPEG right before the choice (really, move
 > BR2_PACKAGE_JPEG_SIMD_SUPPORT before BR2_PACKAGE_JPEG, but diff
 > finds the move of BR2_PACKAGE_JPEG is smaller to display):

 >     [*] jpeg support
 >           jpeg variant (jpeg-turbo)  --->

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
