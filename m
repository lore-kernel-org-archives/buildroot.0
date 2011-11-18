From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 18 Nov 2011 22:09:44 +0100
Subject: [Buildroot] systemd
In-Reply-To: <CAAfyv34FVf5V-ZH4-xapeG8F+2VSgXOWMsf+5O03m9wimRx1Ug@mail.gmail.com>
 (Belisko Marek's message of "Fri, 18 Nov 2011 21:02:42 +0100")
References: <CAAfyv34FVf5V-ZH4-xapeG8F+2VSgXOWMsf+5O03m9wimRx1Ug@mail.gmail.com>
Message-ID: <87obw9rvc7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Belisko" == Belisko Marek <marek.belisko@gmail.com> writes:

 Belisko> Hi,
 Belisko> when looking for ELCE 2011 videos one video was very
 Belisko> interesting:http://events.linuxfoundation.org/events/embedded-linux-conference-europe/kooi
 Belisko> There is a lot of discussion about decreasing boot time for embedded
 Belisko> systems and systemd seems not yet included in buildroot (OE have it
 Belisko> also angstrom).

 Belisko> Is there anybody who working on this or can I start integration to buildroot?

I've taken a quick look, but not done anything concrete about it yet, so
feel free to work on it. Notice that systemd pulls in quite some
dependencies, so it might not really be a net gain in the end depending
on your setup - In Koens presentation he mentioned that his OE setup
spends more than a minute from init to finished booting, which is quite
far from a typical buildroot boot.

-- 
Bye, Peter Korsgaard
