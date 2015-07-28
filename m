From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 09:35:59 +0200
Subject: [Buildroot] [PATCH v3] rtl8188eu: new package
In-Reply-To: <55B72FD4.1030704@lucaceresoli.net>
References: <1437991580-31649-1-git-send-email-luca@lucaceresoli.net>
 <20150727234308.77aff941@free-electrons.com>
 <55B72FD4.1030704@lucaceresoli.net>
Message-ID: <20150728093559.69aa5abb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca,

On Tue, 28 Jul 2015 09:31:32 +0200, Luca Ceresoli wrote:

> I'm OK with this change: better avoiding patches when possible.
> 
> But should patch 3 be merged upstream at some point, I think it would
> be better to revert to my original RTL8188EU_INSTALL_FIRMWARE hook.
> It should continue working of the firmware were moved around the
> package directory hierarchy, and it's even one line shorter (!).
> 
> Do you agree?

Yes, fully agreed. If upstream provides a nice way of installing
firmware, let's use it.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
