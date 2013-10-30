From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Oct 2013 01:14:04 +0100
Subject: [Buildroot] [PATCH v3 1/1] jack2: new package
In-Reply-To: <CAMduVEeEUoQYiixi9J0REN5cFZhv=tfimD8ObrFaktmNuEd+cQ@mail.gmail.com>
References: <1256826d-31b9-4b85-8834-35694e372fac@email.android.com>
 <1382658143-3850-1-git-send-email-wzab01@gmail.com>
 <1382744168-14259-1-git-send-email-wzab01@gmail.com>
 <20131027181024.14201db4@skate>
 <1382903456-5996-1-git-send-email-wzab01@gmail.com>
 <20131028202748.3d03c78f@skate>
 <1383072946-4851-1-git-send-email-wzab01@gmail.com>
 <20131029203433.563d6ced@skate>
 <CAMduVEeEUoQYiixi9J0REN5cFZhv=tfimD8ObrFaktmNuEd+cQ@mail.gmail.com>
Message-ID: <20131030011404.7689a067@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Wojciech Zabolotny,

On Wed, 30 Oct 2013 01:00:11 +0100, Wojciech Zabolotny wrote:


> JACK is free software; you can redistribute it and/or modify it under
> the terms of the GNU GPL and LGPL licenses as published by the Free
> Software Foundation, <http://www.gnu.org>. The JACK server uses the
> GPL, as noted in the source file headers. However, the JACK library is
> licensed under the LGPL, allowing proprietary programs to link with it
> and use JACK services. You should have received a copy of these
> Licenses along with the program; if not, write to the Free Software
> Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
> USA.

I believe this information is enough, and I would encode it as below:

JACK2_LICENSE = GPLv2+ (jack server), LGPLv2.1+ (jack library)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
