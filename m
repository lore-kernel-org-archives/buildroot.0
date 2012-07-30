From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jul 2012 10:31:15 +0200
Subject: [Buildroot] [PATCH 4/6] Add support for appended device tree
 blobs for arm
In-Reply-To: <CAHkwnC8Jizf5RHi0hfeJM4W8AamYhkJ1ixtFC0Cczbm9GmZJVQ@mail.gmail.com>
References: <1342528042-10038-1-git-send-email-maxime.ripard@free-electrons.com>
 <1342528042-10038-5-git-send-email-maxime.ripard@free-electrons.com>
 <5013FBFE.5030702@mind.be>
 <CAHkwnC8Jizf5RHi0hfeJM4W8AamYhkJ1ixtFC0Cczbm9GmZJVQ@mail.gmail.com>
Message-ID: <20120730103115.4704f598@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 30 Jul 2012 10:25:51 +0200,
Fabio Porcedda <fabio.porcedda@gmail.com> a ?crit :

> I tested the patch and doesn't work.
> The MKIMAGE isn't defined anywhere.

Yes, please apply the followup patch that Maxime has posted to you on:

Date: Fri, 27 Jul 2012 20:59:15 +0200
Message-ID: <5012E503.2070005@free-electrons.com>

It should fix this problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
