From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Oct 2013 18:52:56 +0100
Subject: [Buildroot] [PATCH] ext-toolchain: MIPS: Select correct
 endianness for the target
In-Reply-To: <1381744345-8306-1-git-send-email-markos.chandras@imgtec.com>
References: <1381744345-8306-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <20131030185256.1bea8d50@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

On Mon, 14 Oct 2013 10:52:25 +0100, Markos Chandras wrote:
> Previously, an external-toolchain on a mipsel/mips64el target
> didn't select the appriopriate endianness but
> it asked the user to set the correct CFLAGS on his/her own.
> We fix this by appending "-EL" to the toolchain wrapper options
> if the user has selected a mipsel/mips64el target.
> 
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>

Applied to for-peter-2013.11, after making a few fixes (remove the
BR2_ENDIAN test, addition of the big endian case).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
