From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Jan 2015 23:32:15 +0100
Subject: [Buildroot] [PATCH 1/1] qt: add X11 support
In-Reply-To: <1405441856-6263-1-git-send-email-hadrien.boutteville@gmail.com>
 (Hadrien Boutteville's message of "Tue, 15 Jul 2014 18:30:56 +0200")
References: <1405441856-6263-1-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <87k30d5dsg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hadrien" == Hadrien Boutteville <hadrien.boutteville@gmail.com> writes:

Hi,

Sorry for slow response!

 > There are two possible configurations for Qt4 installation: standard
 > (with X11) and embedded (for framebuffer). Both configurations cannot be
 > used together for one installation and some options are specific to one
 > configuration or the other.

 > Add a choice to select the standard or the embedded installation to add
 > X11 support.

 > The integration is done in order to make maximum use of the current
 > configuration logic, for example by using the same mkspecs files.

 > Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
