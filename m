From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jan 2013 09:06:50 +0100
Subject: [Buildroot] [PATCH v2 5/6] lvm2: Compile and install
 application library.
In-Reply-To: <CAAfyv364LfD4uwtOL6+k=Gyd5cvFt-MzXJYx-6e5LLXMgWqsAQ@mail.gmail.com>
References: <1357591399-3566-1-git-send-email-marek.belisko@open-nandra.com>
 <1357591399-3566-6-git-send-email-marek.belisko@open-nandra.com>
 <20130107223802.26215d46@skate>
 <CAAfyv364LfD4uwtOL6+k=Gyd5cvFt-MzXJYx-6e5LLXMgWqsAQ@mail.gmail.com>
Message-ID: <20130116090650.6ae22e1b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Belisko Marek,

On Tue, 15 Jan 2013 21:53:48 +0100, Belisko Marek wrote:

> What about to compile everything (device mapper + app library) and
> only install things which user select in
> config.

That's usually what we do in relatively small packages for which the
overall build time is not so significant to be worth the effort of
doing selective compilation. We however do selective installation if
needed to only install the required files.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
