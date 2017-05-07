From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 07 May 2017 07:23:00 +0200
Subject: [Buildroot] kodi aarch64 support
References: <trinity-41637461-8d25-4a68-a201-0dd8a146259d-1494094631395@3capp-mailcom-bs10>
Message-ID: <kin2udxufq.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 06 May 2017 20:17:11 +0200 schrieb daggs:

> Greetings Bernd,
> 
> I have a question, afaik, kodi 17 supports aarch64 but it seems that it
> is impossible to compile kodi on aarch64 using latest buildroot git.
> why is that? am I missing something?
> 
> Thanks,
> 
> Dagg.

Hi Dagg,

you need this patch for buildroot which is currently under review:
http://patchwork.ozlabs.org/patch/756690/

I am waiting for a decision from Kodi upstream whether they
accept https://github.com/xbmc/xbmc/pull/12014 or not.

After that I will rebase my patch for buildroot.

Regards, Bernd
