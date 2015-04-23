From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 23 Apr 2015 08:23:47 -0300 (BRT)
Subject: [Buildroot] [PATCH v2 1/1] gtest: update recipe to use autotools
In-Reply-To: <20150422224620.7abefdb2@free-electrons.com>
References: <CAHkwnC-cZpP5m5009NiLZM07+t8CFSYVxqTBmNuXEA-x9mGwLg@mail.gmail.com>
 <1429734568-20489-1-git-send-email-casantos@datacom.ind.br>
 <20150422224620.7abefdb2@free-electrons.com>
Message-ID: <871078529.576418.1429788227635.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: buildroot at buildroot.org
> Sent: Wednesday, April 22, 2015 5:46:20 PM
> Subject: Re: [Buildroot] [PATCH v2 1/1] gtest: update recipe to use autotools

> Dear Carlos Santos,
> 
> On Wed, 22 Apr 2015 17:29:28 -0300, Carlos Santos wrote:
> 
>> -$(eval $(cmake-package))
>> +$(eval $(autotools-package))
> 
> I still don't understand. Fabio quoted the README of gtest, which says:
> 
> """
> The Autotools build script (configure + make) is no longer officially
> supportted.  You are encouraged to migrate to your own build system or
> use CMake.
> """
> 
> So why moving from using the supported CMake to the no-longer supported
> autotools build system would be an improvement?
> 
> This really needs more explanations.

I agree that using autotools is not the ideal approach but so I don't have a solution to generate the gtest-config script using CMake. I will spend some additional time on this today and submit and alternate patch if possible.

> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

Carlos Santos (Casantos)
DATACOM, P&D
