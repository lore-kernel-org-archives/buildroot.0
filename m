From: Shawn Goff <shawnjgoff@gmail.com>
Date: Wed, 22 Aug 2012 08:39:55 -0400
Subject: [Buildroot] [PATCH] ifplugd: add --with-initdir= to config
	command
In-Reply-To: <20120822095459.4a73afb0@skate>
References: <1345298656-12714-1-git-send-email-shawnjgoff@gmail.com>
 <20120821115651.7908bfa9@skate>
 <CABYt4-bHDJt9sQd4OyebD-4xg8EU+4ppFJv6y9HEBWFPBs4NDQ@mail.gmail.com>
 <20120822095459.4a73afb0@skate>
Message-ID: <CABYt4-b-E630NcSDfb3MjoRkQ6gMGxmvNta_zNyS-P_O8fPsFA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Error:
configure: error: missing --with-initdir=DIR
full output from make: http://sprunge.us/eRQT

Config:
http://sprunge.us/TITZ

On Wed, Aug 22, 2012 at 3:54 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Le Tue, 21 Aug 2012 09:12:46 -0400,
> Shawn Goff <shawnjgoff@gmail.com> a ?crit :
>
> > I mean the configure script fails when building the package.
>
> It builds fine here. What problem do you encounter, and with what
> configuration?
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
