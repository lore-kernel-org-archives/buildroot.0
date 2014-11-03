From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Nov 2014 22:46:20 +0100
Subject: [Buildroot] [PATCH 2/4] qt5: expose a QT5_QMAKE variable for
 other Qt5 packages
In-Reply-To: <87fve02cbm.fsf@dell.be.48ers.dk>
References: <1414880111-19166-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1414880111-19166-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <87mw8943vw.fsf@dell.be.48ers.dk>
 <20141103222519.7c8797e9@free-electrons.com>
 <87fve02cbm.fsf@dell.be.48ers.dk>
Message-ID: <20141103224620.5c3ffe1d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Mon, 03 Nov 2014 22:39:41 +0100, Peter Korsgaard wrote:

>  >> Should we just use BR2_PACKAGE_QT5BASE everywhere you check for BR2_PACKAGE_QT5?
> 
>  > Where exactly? Or shouldn't we have qt5base selected as soon as qt5 is
>  > enabled?
> 
> Well, that's perhaps the easiest solution, yes. Having qt5 enabled but
> not qt5base doesn't make any sense.
> 
> Will you send an updated series or should I do that here?

I can, but not this week. I'm busy giving a training, and will not have
much free time.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
