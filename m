From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 18:55:15 +0100
Subject: [Buildroot] [PATCH] package/openrc: remove keymaps units if kbd
 package is not selected
In-Reply-To: <20200229211755.GV8743@scaer> (Yann E. MORIN's message of "Sat,
 29 Feb 2020 22:17:55 +0100")
References: <20200229182621.14431-1-unixmania@gmail.com>
 <20200229211755.GV8743@scaer>
Message-ID: <87zhcistx8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Carlos, All,
 > On 2020-02-29 15:26 -0300, unixmania at gmail.com spake thusly:
 >> From: Carlos Santos <unixmania@gmail.com>
 >> 
 >> keymaps and save-keymaps require kbd_mode and dumpkeys, respectively, so
 >> remove them if the kbd package is not selected (e.g. devices with serial
 >> console, only).
 >> 
 >> Signed-off-by: Carlos Santos <unixmania@gmail.com>

 > Applied to master with a small fix:

 >   - expand to three commands to match the existing hook

 > As Adam noted, I also prefer the comment to be outside the conditional
 > block, but that is not a set-in-stone rule. Given that the existing hook
 > had the comment in the conditional block, I kept the new one there too.

Committed to 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
