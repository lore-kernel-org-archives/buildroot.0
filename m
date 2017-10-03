From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Oct 2017 16:46:10 +0200
Subject: [Buildroot] WireGuard upstream contact
In-Reply-To: <CAHmME9owNzp6WrpPwWvAhX57fFiMGVgkV4kkshGqp79SLhKzeA@mail.gmail.com>
 (Jason A. Donenfeld's message of "Tue, 3 Oct 2017 15:54:35 +0200")
References: <CAHmME9owNzp6WrpPwWvAhX57fFiMGVgkV4kkshGqp79SLhKzeA@mail.gmail.com>
Message-ID: <874lrgb87h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jason" == Jason A Donenfeld <Jason@zx2c4.com> writes:

 > Hey guys,
 > I'm delighted to see that you've added WireGuard to buildroot. I've
 > been really hoping for this kind of thing for a long time -- simply
 > for my own usage -- so it's great to see this turn into a reality.

Thanks, and thanks for WireGuard!

 > I thought I'd poke my head in this list and say "hi", as upstream WireGuard.

 > It might be nice to include a little blurb about buildroot on
 > <https://www.wireguard.com/install/>. I suppose the single line for
 > the instruction box would be  CONFIG_BR2_PACKAGE_WIREGUARD=y? Or
 > something different?

Nice - As Thomas mentioned on IRC, CONFIG_ should be dropped, so simply
BR2_PACKAGE_WIREGUARD=y.

 > I sent a package bump to the list a few minutes ago, because it seems
 > like things should start off on a fresh foot, but I assume you're on
 > the mailing list anyway and will see the announcements and handle
 > bumps on your own.

I've recently subscribed to the mailing list, so I should normally
notice new releases.

 > Let me know if you guys need anything upstream to make downstream
 > packaging easier. Thanks again for including it.

Nothing from me at the moment - Besides getting the kernel driver
mainlined, but I guess that is coming sooner or later ;)

-- 
Bye, Peter Korsgaard
