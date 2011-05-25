From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 May 2011 11:53:08 +0200
Subject: [Buildroot] Fwd: How to enable Oprofile while using external
 tool chain?
In-Reply-To: <BANLkTik7bUHUein61uU18019RGZKeVw2qw@mail.gmail.com>
References: <BANLkTikQOCg+ZQy1qc34GWBEo-u7QC41Fg@mail.gmail.com>
	<BANLkTik5J8hTD_OvXrTZ3KYgHGUGPZqGqg@mail.gmail.com>
	<BANLkTimSZBQwAUfcmF=73DR-4BM4nW3cBw@mail.gmail.com>
	<20110525104634.362bc9b9@surf>
	<BANLkTik7bUHUein61uU18019RGZKeVw2qw@mail.gmail.com>
Message-ID: <20110525115308.30f1c7a2@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Beno?t,

Please keep the Buildroot list in Cc for Buildroot-related messages
(or, alternatively, use french for send me private messages ! :-)).

On Wed, 25 May 2011 11:40:10 +0200
Beno?t Mauduit <benoit.mauduit@gmail.com> wrote:

> > Your patch says that it builds a host-binutils, but it's wrong:
> > what it builds is binutils for the target.
> 
> That's why I put quotes on "host" in my commit message.

Yes, that's what I understood from your quotes.

> > Otherwise, would be great to have a proper patch that makes this
> > possible, and that we could merge into Buildroot.
> 
> I've made this patch quickly and know it is ugly. Anyway, i will try
> to update it when i have the time and post it here.

No problem with ugly preliminary patches. I do the same for new
features / complex features. And solving that binutils problem is not
that simple.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
