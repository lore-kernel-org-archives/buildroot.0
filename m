From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Wed, 21 Oct 2015 19:02:03 +0200
Subject: [Buildroot] X11: How do I prevent the target screen from going
 black after 10 minutes?
In-Reply-To: <CAEzGmjCKbQKZWy0WfQaGGoqZgzJ6bjf+4jdZRinx2XLijCZ49A@mail.gmail.com>
References: <CAEzGmjCKbQKZWy0WfQaGGoqZgzJ6bjf+4jdZRinx2XLijCZ49A@mail.gmail.com>
Message-ID: <CAEYzJUH2pcGaafwSJ4dEUY0uvf6a4FNYQ9B-bos6nbWvUSs8RA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21 October 2015 at 18:59, Lennart Ramberg <ramberg.lennart@gmail.com> wrote:
> Hello,
>
> Maybe not a proper Builroot question, but:
> X11: How do I prevent the target screen from going black after 10 minutes?
> There is no xorg.conf (to edit the ServerFlags section).
> I was thinking maybe an overlay with an edited xorg.conf?

Have you tried adding "consoleblank=0" to the kernel command line? (I
_think_ that should do it.)

Best regards,
Bj?rn Forsman
