From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Feb 2018 21:02:32 +0100
Subject: [Buildroot] [PATCH 1/2] mpv: disable mali-fbdev support
In-Reply-To: <20180226154112.12857-1-mahyar.koshkouei@gmail.com> (Mahyar
 Koshkouei's message of "Mon, 26 Feb 2018 15:41:11 +0000")
References: <20180226154112.12857-1-mahyar.koshkouei@gmail.com>
Message-ID: <87fu5mnquf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mahyar" == Mahyar Koshkouei <mahyar.koshkouei@gmail.com> writes:

 > A compile error occurs when attempting to compile mpv with mali support
 > (eg. when odroid-mali package is selected).

 > Signed-off-by: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>

Committed after adding an autobuilder reference, thanks.

-- 
Bye, Peter Korsgaard
