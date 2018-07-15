From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 15 Jul 2018 09:30:29 -0500
Subject: [Buildroot] [PATCH v3 1/6] tini: new package
In-Reply-To: <20180715010732.21765-7-christian@paral.in>
References: <20180715010732.21765-1-christian@paral.in>
 <20180715010732.21765-7-christian@paral.in>
Message-ID: <CANQCQpZMenYxEt6KLzXKqjyiBb4FQ_nHjwN0i3RXhZArZiGwRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian,

On Sat, Jul 14, 2018 at 8:07 PM, Christian Stewart <christian@paral.in> wrote:
>
> Tini is a minimal init process to act as PID 1 for containers.
>
> Tini can be used to satisfy docker-engine's docker-init binary
> requirement.

What's the best way for me to build a test configuration for this
series?  Is there a buildroot defconfig you tailor for host vs
container?  Wondering if a test case would be a good way to capture
how this is being used? (I'm more then happy to write the case and try
it.  Been meaning to tinker with docker :-) )

Matt
