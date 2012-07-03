From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 03 Jul 2012 23:52:02 +0200
Subject: [Buildroot] gtk+
In-Reply-To: <87mx3g1x5r.fsf@macbook.be.48ers.dk>
References: <1341046722.72419.YahooMailNeo@web160706.mail.bf1.yahoo.com>
 <20120703111106.7f544276@skate> <1341329317.31903.16.camel@sven>
 <20120703175921.508fc6fc@skate> <87mx3g1x5r.fsf@macbook.be.48ers.dk>
Message-ID: <1341352322.2154.0.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, 2012-07-03 at 21:07 +0200, Peter Korsgaard wrote:

>  Thomas> I haven't looked in details, but:
> 
>  Thomas> commit 1c4dbb5fa7df89731e5d59f680e9dc34f24f8835
>  Thomas> Author: Peter Korsgaard <jacmet@sunsite.dk>
>  Thomas> Date:   Mon Aug 30 10:02:39 2010 +0200
> 
>  Thomas>     pango: needs C++ for freetype handling
> 
>  Thomas>     Pango was recently updated to v1.28 as a dependency of
>  Thomas>     webkit, but its freetype support has unfortunately been
>  Thomas>     rewritten with parts in C++ (since pango 1.25), so adjust
>  Thomas>     dependencies of pango and users of it to require C++
>  Thomas>     support.
> 
> Ahh yes, the harfbuzz text shaping engine:
> 
> find -name \*.cc
> ./pango/opentype/hb-font.cc
> ./pango/opentype/hb-ot-layout.cc
> ./pango/opentype/main.cc
> 
> http://www.freedesktop.org/wiki/Software/HarfBuzz

Ah, indeed. Thanks for pointing this out.


Regards,
Sven
