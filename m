From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Dec 2016 16:49:33 +0100
Subject: [Buildroot] [PATCH v3 0/7] qt5 bump to 5.8.0-rc
In-Reply-To: <1481641171-10407-1-git-send-email-anaumann@ultratronik.de>
References: <1481641171-10407-1-git-send-email-anaumann@ultratronik.de>
Message-ID: <20161213164933.6ffc2b51@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Dec 2016 15:59:24 +0100, Andreas Naumann wrote:
> This is a rework of Julien and my previous work with the -rc version, which
> now is available as a snapshot.
> 
> I have tried to adress the comments given by Julien and Arnout. In addition I
> updated the license stuff, hope that this is correct.
> 
> As a result of https://bugreports.qt.io/browse/QTBUG-57039, I could make the
> patch for directfb slightly smaller. However for non GL platforms there is
> still an issue (QTBUG-57176).
> 
> A new change is the removal of gstreamer config-options in qt5base since this
> is now completely done in qtmultimedia.

Thanks for working on Qt packaging, definitely very important for
Buildroot.

Do you know when the final 5.8 is supposed to be released? If it's
released before Buildroot 2017.02, then we could take your patches
right now, and update them to the final release when it comes out. This
way, they would get some exposure (both in terms of Buildroot users
exposure, and in terms of autobuilder testing).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
