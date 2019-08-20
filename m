From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Aug 2019 16:30:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/expect: bump to version 5.45.4
In-Reply-To: <CAPi7W82UXKDeC9Tcy=m+ArjuwFG8x8HP=Re8ph6+XDmE33QPtA@mail.gmail.com>
 (Fabrice Fontaine's message of "Tue, 30 Jul 2019 23:58:10 +0200")
References: <20190729211556.21522-1-fontaine.fabrice@gmail.com>
 <8736in5hog.fsf@dell.be.48ers.dk>
 <CAPi7W82UXKDeC9Tcy=m+ArjuwFG8x8HP=Re8ph6+XDmE33QPtA@mail.gmail.com>
Message-ID: <87blwj9af5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Dear Peter,
 > Le mar. 30 juil. 2019 ? 23:36, Peter Korsgaard <peter@korsgaard.com> a ?crit :
 >> 
 >> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
 >> 
 >> > * exp_inter.c: [https://sourceforge.net/p/expect/patches/22/]
 >> > Fix interact bug - handle reads of 0 length on
 >> > non-blocking channels by explicitly checking if the channel
 >> > is non-blocking. Fix by Jack Bates.
 >> 
 >> > * expect.c: [https://sourceforge.net/p/expect/patches/21/]
 >> > Fix eof bug introduced with previous bug fix - ensure that data
 >> > received just before an eof is processed. Fix by Sergei Golovan.
 >> 
 >> So does this mean that it should be applied to 2019.02.x and 2019.05.x
 >> as well?
 > Yes, it should.

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
