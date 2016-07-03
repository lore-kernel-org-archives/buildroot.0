From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Jul 2016 10:15:09 +0200
Subject: [Buildroot] [PATCH 2/2] acpica: new package
In-Reply-To: <CAK4VdL15DMSXe-y5vzAffjRA6JV2XLUqUwbwmL4rGPd5m8U9gg@mail.gmail.com>
 (Erico Nunes's message of "Sat, 2 Jul 2016 12:45:21 +0200")
References: <1459016777-27952-1-git-send-email-nunes.erico@gmail.com>
 <1459016777-27952-2-git-send-email-nunes.erico@gmail.com>
 <a3fe6cc6-15ac-b2e4-d995-9fbd25ce034c@smile.fr>
 <CAK4VdL15DMSXe-y5vzAffjRA6JV2XLUqUwbwmL4rGPd5m8U9gg@mail.gmail.com>
Message-ID: <87shvr2l4i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Erico" == Erico Nunes <nunes.erico@gmail.com> writes:

 > Hi Romain,
 > thank you very much for your review and testing.

 > On Sat, Jul 2, 2016 at 11:54 AM, Romain Naour <romain.naour@smile.fr> wrote:
 >> The license seems to be a BSD like or GPLv2

 > I've look again and indeed it looks like a dual license, I'll update
 > accordingly.

 >> Maybe you can use TARGET_CONFIGURE_OPTS like as Peter suggested in [1]

 > Ok. By the way, during some more testing after your comment, I've
 > found that it builds without errors but fails to install on non-x86_64
 > architectures due to the use of "install -s" (install fails attempting
 > to use 'strip' from the host on other architectures).

 > I'll have that fixed too in a v2.

Ok. Don't forget to send the v2 patch. I'll mark this patch as changes
requested in patchwork.

-- 
Bye, Peter Korsgaard
