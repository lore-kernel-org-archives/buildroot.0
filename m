From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Apr 2015 23:49:14 +0200
Subject: [Buildroot] [PATCH/RFC 03/27] package/kodi: bump version to
 15.0 Alpha2-Isengard
In-Reply-To: <XnsA476E4CF4CDF7berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
 <1427913380-14808-4-git-send-email-bernd.kuhls@t-online.de>
 <20150404184448.3fea759b@free-electrons.com>
 <XnsA476E4CF4CDF7berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20150421234914.04230ff1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Wed, 08 Apr 2015 22:29:35 +0200, Bernd Kuhls wrote:

> http://kodi.wiki/view/Development_builds#Monthly_build
> "Kodi developers have a merge cycle every month for new features and major 
> changes. For ten days they add new features, then for the rest of the month 
> they fix things."
> 
> Alpha 2 was released an April 1st, I expect Beta 1 at the beginning of May 
> and a release maybe one month later with several RC before that. So no, Kodi 
> 15.0 will not be part of buildroot 2015.05, but as Yann already pointed out, 
> I am sending my current patch series as RFC early to pave the way for this 
> "beast" ;)

Following this reply, I've marked all the patches as RFC in patchwork,
except PATCH 2 (tinyxml2), which has been applied. PATCH 1 could have
been merged separately from the Kodi bump, but there have been numerous
changes requested by Yann, so they need to be addressed before the
patch can be applied.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
