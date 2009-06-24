From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 24 Jun 2009 09:59:03 +0200
Subject: [Buildroot] How to get symbolic debugging to work?
In-Reply-To: <h1r69p$kd5$1@ger.gmane.org>
References: <h1p5br$11r$1@ger.gmane.org>  <h1r69p$kd5$1@ger.gmane.org>
Message-ID: <1245830343.3872.9.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, 2009-06-23 at 18:18 +0000, Grant Edwards wrote:
> On 2009-06-22, Grant Edwards <grant.b.edwards@gmail.com> wrote:
> 
> > I've given up temporarily on getting thread support to work in
> > gdbserver.  Now I'm just trying (and failing) to get basic
> > symbolic debugging to work.
> 
> Gdb 6.8 just plain doesn't work for ARM targets.
> 
> I switched to 6.7.1, and it works fine (including debugging
> multiple threaded apps).

We also have problems with gdb 6.8 on the ARM. Or in other words, it
just plain does not work. I will now follow your advice and switch to
version 6.7.1. If that actually helps, then buildroot should probably
select that version when building for an ARM target (similar as what is
done currently for AVR32).


Sven
