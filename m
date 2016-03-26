From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sat, 26 Mar 2016 14:57:55 -0500
Subject: [Buildroot] [PATCH 1/1] setools: disable arch sparc64
In-Reply-To: <20160326185327.253d354e@free-electrons.com>
References: <1458698562-11227-1-git-send-email-matt@thewebers.ws>
 <20160323130907.3c2c28ff@free-electrons.com>
 <CAFt09wP3f3xJWf96Av=gs6yTQ2NCim+OfsvcR8W3ojvrzKLvbw@mail.gmail.com>
 <20160326185327.253d354e@free-electrons.com>
Message-ID: <CANQCQpbzJ6esrVsX=u+pQqV7iywY5phEsqq1-2v-J0wNp5dVQg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mar 26, 2016 12:53 PM, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:
>
> Hello,
>
> On Wed, 23 Mar 2016 16:31:13 -0500, Matthew Weber wrote:
>
> > Good to know.  I'll reject this patch and do some further testing.
>
> In fact, it's just -fPIC vs. -fpic. I've committed a fix:
>
>
https://git.busybox.net/buildroot/commit/?id=8a2e75633f136f021692354434ac0b2d9a81e38c
>

Appreciated!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160326/5397be91/attachment.html>
