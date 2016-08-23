From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 23 Aug 2016 19:54:55 +0200
Subject: [Buildroot] Future of linphone package,
 was: Re: [PATCH/next 2/4] DEVELOPERS: add initial list of Buildroot
 developers
References: <1471902678-18693-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1471902678-18693-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <670f6e5c-e513-6b3f-ed82-4da1ddc3d141@lucaceresoli.net>
 <20160823134138.6f9818ef@free-electrons.com>
Message-ID: <f8fu8dx2gc.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 23 Aug 2016 13:41:38 +0200 schrieb Thomas Petazzoni:

> However, for linphone, it's a bit annoying because it means no-one is
> looking after this package. Should we deprecate it?

Hi Thomas,

the last patches to linphone were done by me but please do not add
me to the list of developers for this package because I do not use
it on a buildroot-build system myself.

The problem with linphone is that buildroot carries version 3.6 which
received its last bump in 2013. The current release 3.9.1 was done in
November 2015, so upstream is still alive.

Since version 3.7.0[1] linphone requires the belle-sip[2] package. Last
year I briefly tried to bump linphone and failed, afair because I could
not cross-compile antlr3[3], which is a dependency[4] of belle-sip.

Regards, Bernd

[1] https://github.com/BelledonneCommunications/linphone/blob/master/NEWS#L119
[2] https://github.com/BelledonneCommunications/belle-sip
[3] https://github.com/antlr/antlr3
[4] https://github.com/BelledonneCommunications/belle-sip/blob/master/README#L23
