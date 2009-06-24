From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 24 Jun 2009 11:16:56 +0200
Subject: [Buildroot] How to get symbolic debugging to work?
In-Reply-To: <1245830343.3872.9.camel@sven>
References: <h1p5br$11r$1@ger.gmane.org> <h1r69p$kd5$1@ger.gmane.org>
	<1245830343.3872.9.camel@sven>
Message-ID: <20090624091656.GD22116@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 24, 2009 at 09:59:03AM +0200, Sven Neumann wrote:
>Hi,
>
>On Tue, 2009-06-23 at 18:18 +0000, Grant Edwards wrote:
>> On 2009-06-22, Grant Edwards <grant.b.edwards@gmail.com> wrote:
>> 
>> > I've given up temporarily on getting thread support to work in
>> > gdbserver.  Now I'm just trying (and failing) to get basic
>> > symbolic debugging to work.
>> 
>> Gdb 6.8 just plain doesn't work for ARM targets.
>> 
>> I switched to 6.7.1, and it works fine (including debugging
>> multiple threaded apps).
>
>We also have problems with gdb 6.8 on the ARM. Or in other words, it
>just plain does not work. I will now follow your advice and switch to
>version 6.7.1. If that actually helps, then buildroot should probably
>select that version when building for an ARM target (similar as what is
>done currently for AVR32).

Alternatively you could check if it works OK with the current gdb and
file a bug either against 6.8 with or CVS

PS: I see that you don't have a required fix for m68k for 6.8, just as a sidenote
