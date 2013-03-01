From: Daniel Price <daniel.price@gmail.com>
Date: Thu, 28 Feb 2013 20:25:59 -0800
Subject: [Buildroot] [PATCH] Add Qt5 packages
In-Reply-To: <513011C9.8030301@je-eigen-domein.nl>
References: <1362007582-14753-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <513011C9.8030301@je-eigen-domein.nl>
Message-ID: <CAKduhSsmDGk2w8p79_KY7Zb5hwdH0D-2z7kAcQK_Q5rakZGhfg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Floris,

That build problem in V8 is exactly the same as the one I had to fix
in my nodejs (which also uses V8) patch, which I posted today.  See
https://code.google.com/p/v8/source/detail?r=12094 for the fix.

Thomas, if we're going to have V8 in multiple places, perhaps it
should be a separate package?  On the flip side, I don't know how
sensitive webkit and nodejs are to version skew in V8.

       -dp
