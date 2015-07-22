From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 22 Jul 2015 21:26:38 +0200
Subject: [Buildroot] [PATCH/RFC v3 00/50] package/kodi: bump version to
	15.0 rc2 Isengard
References: <1437332755-9764-1-git-send-email-bernd.kuhls@t-online.de>
 <20150719212605.3a908e3f@free-electrons.com>
 <XnsA4DE5385A8A24berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20150721142341.4b294467@free-electrons.com>
Message-ID: <XnsA4DFDA2401224berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20150721142341.4b294467 at free-
electrons.com:

> Bernd,
> 
> On Tue, 21 Jul 2015 08:12:38 +0200, Bernd Kuhls wrote:
> 
>> patch 1: ffmpeg bump
>> Please do _not_ commit it yet, because removing 0014-fix-ff-thread-get-
>> format.patch will break Kodi 14.2, currently part of buildroot.
> 
> Next time, can you make this more clearly indicated somewhere? Well, I
> agree your entire series was RFC, but it's good to be clear about what
> can be committed now and what cannot. I generally want to be helpful
> and merge early what is ready today, so that contributors don't have to
> carry more and more patches in their own branches.

I appreciate your position about partly committing stuff from large patch 
series to reduce the burden on contributors like me, but I clear said in 
the cover letter:

"this series is a RFC and not meant for committing to buildroot."

This included also ffmpeg because I knew from a previous ffmpeg bump that 
Kodi 14.2 needs 0014-fix-ff-thread-get-format.patch:
http://git.buildroot.net/buildroot/commit/package/ffmpeg/0014-fix-ff-
thread-get-format.patch?id=032e2beedfe7f503f0686470ae930d4c8b41b780

I can assure you that I will send patches separately which solve problems I 
come across when doing work on Kodi which are not directly related to such 
a huge version bump like this one ;)

> Ok. I hope Kodi 15.0 will arrive soon so that we can merge all of it,
> and have a working setup again.

Kodi 15.0 was released yesterday! -> http://kodi.tv/

>> > Maybe you could push the whole thing to a public Git branch so that
>> > others can quickly test?

I guess this is not necessary anymore ;) I try to send the 15.0 version 
bump series this evening, I just have to finish the Config.in.legacy stuff.

Regards, Bernd
