From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Dec 2012 17:41:58 +0100
Subject: [Buildroot] [PATCH 10/13] Add update-all-config target
In-Reply-To: <50BCB4A3.5080003@relinux.de>
References: <20121013231344.17317.92930.stgit@localhost>
 <20121013231438.17317.13801.stgit@localhost>
 <CAAXf6LWwO6OkBhz03vsBekTWv4=9Bb7eO-sskvzhdTCD58K7oA@mail.gmail.com>
 <50BCB4A3.5080003@relinux.de>
Message-ID: <20121203174158.52e5223f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stephan Hoffmann,

On Mon, 03 Dec 2012 15:18:11 +0100, Stephan Hoffmann wrote:

> I'd like to go one step further and put buildroot's default config files
> in the board/company/product hierarchy, too. Then everything would be in
> one place.

This is what we had a long time ago, but it was changed for the current
approach.

See the discussion at
http://lists.busybox.net/pipermail/buildroot/2009-October/029556.html
(note: the discussion starts on October 2009, but continues on November
2009, and the mailing list archive doesn't show it as one single
thread).

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
