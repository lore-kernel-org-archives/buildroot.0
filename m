From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 14 Feb 2012 23:33:37 +0100
Subject: [Buildroot] [git commit branch/next] DOWNLOAD_WGET: use -O
	instead of -P to set output file
In-Reply-To: <CA+appbOf=yN3pWw_HC12BL3sy=SUbMK2CE7pa6MeaQMvLwO6fg@mail.gmail.com>
 (Spenser Gilliland's message of "Tue, 14 Feb 2012 11:54:22 -0600")
References: <20120214115140.4C70390A99@busybox.osuosl.org>
 <CA+appbOppm780+jAe6LKqGR9mendwqdtvfTEB=Cntrz=5RynSQ@mail.gmail.com>
 <CAM+bi4uo_s_xMy-XVfNhSBwwm70jMxmz5UXB71fbV+=pROYdNQ@mail.gmail.com>
 <87sjidv1yx.fsf@macbook.be.48ers.dk>
 <CA+appbNv_c0r_uDZWw=x3WiHtykt3xX9qrQUTA4YMFq-AUgZ4w@mail.gmail.com>
 <87k43pv0mi.fsf@macbook.be.48ers.dk>
 <CA+appbOf=yN3pWw_HC12BL3sy=SUbMK2CE7pa6MeaQMvLwO6fg@mail.gmail.com>
Message-ID: <87y5s5t58e.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Spenser" == Spenser Gilliland <spenser309@gmail.com> writes:

 Spenser> Peter,
 Spenser> After greping through the source the enormity of that patch and the
 Spenser> potential for out of tree breakage suggest a different course of
 Spenser> action.  A possible solution may be to scan the SITE var for a
 Spenser> question mark and only change to non-slash mode on that occasion.
 Spenser> Would this be reasonable?

Hmm, neither solution is really nice. Let me think a bit more about it.

-- 
Bye, Peter Korsgaard
