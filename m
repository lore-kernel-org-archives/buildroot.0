From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 May 2013 21:47:51 +0200
Subject: [Buildroot] [PATCH] qt5jsbackend: only available on ARM, x86,
 x86-64 and mipsel
In-Reply-To: <87a9nd60wj.fsf@dell.be.48ers.dk>
References: <1369772826-8019-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87a9nd60wj.fsf@dell.be.48ers.dk>
Message-ID: <20130529214751.1dbdfa09@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 29 May 2013 21:28:44 +0200, Peter Korsgaard wrote:

> You seem to have forgotten qt5graphicaleffects, which also selects
> qt5declarative.

Gaah, right. Seems like there's some hole in my grep :)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
