From: Carlos Santos <casantos@datacom.ind.br>
Date: Tue, 5 Jun 2018 08:22:59 -0300 (BRT)
Subject: [Buildroot] [PATCHv2 proposal/next 2/3] build: replace
 host-mkpasswd with host-busybox
In-Reply-To: <48945091-d169-18ba-31d0-a51c64e9a918@mind.be>
References: <20180601125900.26400-1-chemobejk@gmail.com>
 <20180601133053.27552-1-chemobejk@gmail.com>
 <20180601133053.27552-3-chemobejk@gmail.com>
 <48945091-d169-18ba-31d0-a51c64e9a918@mind.be>
Message-ID: <935950713.1169230.1528197779003.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Arnout Vandecappelle" <arnout@mind.be>
> To: "Stefan Becker" <chemobejk@gmail.com>, "buildroot" <buildroot@buildroot.org>
> Cc: "Yann Morin" <yann.morin.1998@free.fr>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> Sent: Monday, June 4, 2018 7:21:10 PM
> Subject: Re: [Buildroot] [PATCHv2 proposal/next 2/3] build: replace host-mkpasswd with host-busybox

> On 01-06-18 15:30, Stefan Becker wrote:
>> host-mkpasswd was a fork from whois to provide a host version of
>> mkpasswd for the build. This has caused a maintenance headache.
>> 
>> Replace it with host-busybox which can provide "mkpasswd" functionality
>> from own source code. That causes less hassle for different build
>> platforms.
> 
> Just to be clear: does everybody agree that it is a good idea to use
> weakly-random numbers as salt, rather than real random numbers like whois does?

Wouldn't it be better to add a host version of the whois package that
installs mkpasswd, only?

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
