From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 5 Jun 2018 00:21:10 +0200
Subject: [Buildroot] [PATCHv2 proposal/next 2/3] build: replace
 host-mkpasswd with host-busybox
In-Reply-To: <20180601133053.27552-3-chemobejk@gmail.com>
References: <20180601125900.26400-1-chemobejk@gmail.com>
 <20180601133053.27552-1-chemobejk@gmail.com>
 <20180601133053.27552-3-chemobejk@gmail.com>
Message-ID: <48945091-d169-18ba-31d0-a51c64e9a918@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-06-18 15:30, Stefan Becker wrote:
> host-mkpasswd was a fork from whois to provide a host version of
> mkpasswd for the build. This has caused a maintenance headache.
> 
> Replace it with host-busybox which can provide "mkpasswd" functionality
> from own source code. That causes less hassle for different build
> platforms.

 Just to be clear: does everybody agree that it is a good idea to use
weakly-random numbers as salt, rather than real random numbers like whois does?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
