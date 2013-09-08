From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Sep 2013 19:31:13 +0200
Subject: [Buildroot] [RFCv1 01/11] Makefile: make $(BUILD_DIR)/.root
 rule idempotent
In-Reply-To: <CANxTyt5T+GUhU4EuDChEvfPze-9uCAb8mMNy-X-2Jn=fmMi9rg@mail.gmail.com>
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378416469-17708-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <CANxTyt4-UNps4mw2KRMbg9TGjj03e5eL5vczCJORuE4as4HwQg@mail.gmail.com>
 <20130908153034.10b46fdf@skate>
 <CANxTyt5T+GUhU4EuDChEvfPze-9uCAb8mMNy-X-2Jn=fmMi9rg@mail.gmail.com>
Message-ID: <20130908193113.67a7c635@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Sun, 8 Sep 2013 12:59:23 -0400, Danomi Manchego wrote:

>  "ln -sf" is not sufficient for a symlink to a directory - you need "ln
> -snf" - the -n treats the directory symlink as a file, which prevents this
> very problem.

Aah, good!

> Using the "ln -snf" lets you drop the if statements, so it seems desirable.

Right, makes sense. I'll fix this up for the next iteration of the
patch series.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
