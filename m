From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 27 Apr 2018 08:05:10 -0500
Subject: [Buildroot] [PATCH v4 02/13] security hardening: add RELFO,
 FORTIFY options
In-Reply-To: <CAJtjsKb1+dDbkhYw5ZHoTzRSpRfxxygATWoHpjLQ=1ngZWG0fQ@mail.gmail.com>
References: <1516766992-48428-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1516766992-48428-2-git-send-email-matthew.weber@rockwellcollins.com>
 <CAJtjsKb1+dDbkhYw5ZHoTzRSpRfxxygATWoHpjLQ=1ngZWG0fQ@mail.gmail.com>
Message-ID: <CANQCQpZCkSXDtXBEoo8XKdfA9384cwK1UheURZ5jq9y5adbr6Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Johan,

On Thu, Apr 26, 2018 at 10:55 AM, Johan Oudinet <johan.oudinet@gmail.com> wrote:
> Hi Matt,
>
[snip]
>
> I don't think -fstack-protector* flags belongs to the preprocessor flags.
> Why did you move them from CFLAGS and CXXFLAGS? Your commit message
> suggests this was an proposition from Arnout but I can't find his
> email where he says that.
>

There's a new patchset proposed this week which should resolve this.
I also noticed a couple other half/full RELO issues too after things
were merged, my testing on that original set missed some cases.

Pending patches(I've tested these and they look good for my test case)
http://patchwork.ozlabs.org/project/buildroot/list/?series=40826

Matt
