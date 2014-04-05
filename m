From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Apr 2014 16:45:38 +0200
Subject: [Buildroot] host-binutils broken?
In-Reply-To: <CAMo8BfJZbpLA0VhG08bKT5OYvmNydEYJ_TW-FUU9oBpsdKjV+w@mail.gmail.com>
References: <533EED51.9090204@freescale.com>
 <CAMo8BfJhxpqBFmFeADF97cKbANtzNFYy2_L=wrMjLn8zUtinyw@mail.gmail.com>
 <loom.20140404T230545-334@post.gmane.org>
 <CAMo8BfKN8NAsfS1aM31TzjUvfJ1EFRQTZVnxH4U2M0BN0XWq1A@mail.gmail.com>
 <533FF599.70104@bergerie>
 <CAMo8Bf+twN0uqjLquE7GYVpf1CP0UndHy924Ome3c84dqP4Y0A@mail.gmail.com>
 <CAMo8BfJZbpLA0VhG08bKT5OYvmNydEYJ_TW-FUU9oBpsdKjV+w@mail.gmail.com>
Message-ID: <20140405164538.2109f7f2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Sat, 5 Apr 2014 18:35:12 +0400, Max Filippov wrote:

> Yes, now make as.info fails for me too. However, it fails for me both
> with and without
> my patch. Seems to me the easiest fix would be to drop *.texi hunks from my
> patch to binutils to just avoid as.info rebuild. Ok?

Sounds good. Can you send a followup patch that does this?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
