From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Oct 2016 17:42:48 +0200
Subject: [Buildroot] [PATCH] config/odroidc2: force usage of gcc 4.9.x
In-Reply-To: <20161006111459.25547-1-daggs@gmx.com> (Dagg Stompler's message
 of "Thu, 6 Oct 2016 14:14:59 +0300")
References: <20161006111459.25547-1-daggs@gmx.com>
Message-ID: <87zimhlc07.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Dagg" == Dagg Stompler <daggs@gmx.com> writes:

 > due to an issue with odroid's u-boot, compiling u-boot with
 > gcc 5.x will result in a non booting image.
 > so a gcc 4.9.x compiler must be used.
 > this solve bug #9326

 > thanks to Erico Nunes <nunes.erico@gmail.com> for pointing
 > to the right issue.

 > Reported-by: <gahabana@mail.com>
 > Signed-off-by: Dagg Stompler <daggs@gmx.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
