From: =?utf-8?B?SsOpcsO0bWU=?= Oufella <jerome.oufella@savoirfairelinux.com>
Date: Mon, 25 Apr 2016 10:29:35 -0400 (EDT)
Subject: [Buildroot] [PATCH v1 4/4] ring-daemon: new package
In-Reply-To: <20160423001924.38960007@free-electrons.com>
References: <1461358628-9352-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
 <1461358628-9352-5-git-send-email-patrick.keroulas@savoirfairelinux.com>
 <20160423001924.38960007@free-electrons.com>
Message-ID: <1270951286.99452.1461594575969.JavaMail.zimbra@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

I'm bumping that thread to ring at lists.savoirfairelinux.net for
convenience.

Thomas Petazzoni thomas.petazzoni at free-electrons.com wrote:
(ref http://permalink.gmane.org/gmane.comp.lib.uclibc.buildroot/146902)

> Hello,
> 
> Thanks again for this contribution. As a side note, we tried Ring at
> work as a replacement for Google Hangouts, but unfortunately, the
> quality level was really bad as soon as more than 3/4 persons joined
> the call. Since I know Savoir Faire Linux is behind the Ring project,
> do you know if this is something that might be improved in the future?

When using Ring in a n-way conferencing setup, the peer
initiating the conference bridge acts as a network and encoding
hub for the rest of the audience. This means that if the
conference hub either reaches bandwidth or cpu limits, the global
call quality will inevitably be degraded severely, that would be
a first point to verify.

You may also be impacted by the ambient noise as I don't think
Ring performs prioritization of the talker (correct me if I'm
wrong) and the echo canceller may not be super efficient at
times.

In any cases, any input from you that may allow us to pinpoint and
avoid the quality drop will be of interest.

Cheers,
Jerome
