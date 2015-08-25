From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Aug 2015 12:39:33 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-08-24
In-Reply-To: <55DC42A1.6060003@imgtec.com>
References: <20150825063012.C9C1510159F@stock.ovh.net>
 <55DC42A1.6060003@imgtec.com>
Message-ID: <20150825123933.382f5e06@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente,

On Tue, 25 Aug 2015 11:25:37 +0100, Vicente Olivert Riera wrote:
> Dear Thomas Petazzoni,

Hehe, copying my stupid "Dear <foo>" automatic template? :-)

> On 08/25/2015 07:30 AM, Thomas Petazzoni wrote:
> > Build statistics for 2015-08-24
> 
> >         mips | ltrace-c22d359433b333937ee3... | NOK | http://autobuild.buildroot.net/results/e1a99784d7cbd5a14808f6d8fc27994b44e996c4/
> 
> Fixed by:
> 
>   http://patchwork.ozlabs.org/patch/507709/

Will have a look.

> >     mips64el |                   midori-0.5.9 | NOK | http://autobuild.buildroot.net/results/80ffdf54fd675fbff5a645784cd041cdf862154c/
> >     mips64el |                   midori-0.5.9 | NOK | http://autobuild.buildroot.net/results/1c049845ade60de223296c77c8a70869c4db64f0/
> 
> Currently investigating.

Thanks!

> >     mips64el |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/10bd119bae1ee158a10ce542e9e991719e240b45/
> >       x86_64 |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/29caf899bb6d0a591a533af024b4262d0ef4ce96/
> >         mips |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/d0a37acf8a9377cd9c5a99aaaa867ae72276b4a8/
> >       x86_64 |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/6386886945292e86c6b8c08311c1125d9760e258/
> >          sh4 |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/22009a4acceab9b99e811784ca59b2fc17de0fcb/
> >     mips64el |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/66d962ed0fa6adf5ebbf24965df5afec16791a99/
> 
> Fixed by Bernd Kuhls' series:
> 
> http://patchwork.ozlabs.org/patch/505307/
> http://patchwork.ozlabs.org/patch/505305/
> http://patchwork.ozlabs.org/patch/505306/

All applied now.

> >          arm |                    zyre-v1.0.0 | NOK | http://autobuild.buildroot.net/results/b07f5ab8657d6c6515e90f3d41ee23cab14c3f44/
> 
> Fixed by:
> 
>   http://patchwork.ozlabs.org/patch/509957/

Seen the patch, but I remain unhappy with hardcoded -l<foo> flags. I
know you tried to use pkg-config without success, but still :-/

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
