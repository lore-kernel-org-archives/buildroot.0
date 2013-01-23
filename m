From: Willy Lambert <lambert.willy@gmail.com>
Date: Wed, 23 Jan 2013 10:06:00 +0100
Subject: [Buildroot] Boost integration
In-Reply-To: <87libk2s6i.fsf@dell.be.48ers.dk>
References: <CAKvQZ_1g6_KHpdyYQ6H-pk6T5gx-qsW6SvaF7XBb2JJCSf7cLg@mail.gmail.com>
 <201301222220.14854.yann.morin.1998@free.fr>
 <CAKvQZ_0f+7B8N5Fp0O6tDUxYYeuUd+wD-92-ec-hvR8KzfjDoA@mail.gmail.com>
 <CAKvQZ_2XrayYK1DuVAUCDQkoeOHqv6iB2QT0b-pKy_y7AXv2bA@mail.gmail.com>
 <87libk2s6i.fsf@dell.be.48ers.dk>
Message-ID: <CAKvQZ_2aGiOzea_GmPjW3x+chDSRTicmFB3+MDh8fsCgROZ8oA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/1/23 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Willy" == Willy Lambert <lambert.willy@gmail.com> writes:
>
> Hi,
>
>  Willy> I see that you put the sources tarball on :
>  Willy> http://sources.buildroot.net/
>  Willy> and many other are taken from here.
>
>  Willy> Is it a good practice to put all there to keep the availibility
>  Willy> of all links, or is it just because no external links exist ?
>
> It's just a backup in case upstream is down/disappears.
>
> --
> Bye, Peter Korsgaard

Ok, then the current link to boost sourceforge seems broken, does
anyone else has the same problem ?

Maybe : BOOST_SITE =
http://sourceforge.net/projects/boost/files/boost/$(BOOST_VERSION)
would be a working solution, butI found it by tries and fails so it is
maybe not the best link.

I can propose you a patch to be abble to select different version a
boost in config menus. But I'm not sure that the current mk can handle
other versions.

I personnaly put Boost in Packages->Librairies->Boost. It is currently
in a "Other" menu.Don't you think it would be a better place ?
