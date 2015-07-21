From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Jul 2015 14:23:41 +0200
Subject: [Buildroot] [PATCH/RFC v3 00/50] package/kodi: bump version to
 15.0 rc2 Isengard
In-Reply-To: <XnsA4DE5385A8A24berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1437332755-9764-1-git-send-email-bernd.kuhls@t-online.de>
 <20150719212605.3a908e3f@free-electrons.com>
 <XnsA4DE5385A8A24berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20150721142341.4b294467@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Tue, 21 Jul 2015 08:12:38 +0200, Bernd Kuhls wrote:

> patch 1: ffmpeg bump
> Please do _not_ commit it yet, because removing 0014-fix-ff-thread-get-
> format.patch will break Kodi 14.2, currently part of buildroot.

Next time, can you make this more clearly indicated somewhere? Well, I
agree your entire series was RFC, but it's good to be clear about what
can be committed now and what cannot. I generally want to be helpful
and merge early what is ready today, so that contributors don't have to
carry more and more patches in their own branches.

> I saw that you committed it already; when Kodi 15.0 hits buildroot the 
> error will go away, until then let_s get ffmpeg 2.7.x tested by the 
> autobuilders, mips* has problems with msa.h for example ;) Btw, I will send 
> another bump to 2.7.2 today fixing interlaced h264.

Ok. I hope Kodi 15.0 will arrive soon so that we can merge all of it,
and have a working setup again.

> patch 2 & 3: no problem, they do not raise compatibility issues

Ok.

> patch 4: please do _not_ commit, libcec3 is incompatible with Kodi 14.

Ok, thanks.

> > Maybe you could push the whole thing to a public Git branch so that
> > others can quickly test?
> 
> Ok, but I have to set this up first. I already have a github account and I 
> think I can handle that task.
> Can I fork from https://github.com/buildroot/buildroot ?

Yes, sure. This repository is updated every 10 minutes or so from the
official Buildroot repo. The only thing that isn't synced up
automatically are tags, I'll have to address that in the future.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
