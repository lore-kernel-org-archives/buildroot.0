From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Tue, 16 Aug 2011 23:43:06 +0200
Subject: [Buildroot] busybox .config
In-Reply-To: <CALo-6+gPAV892XX=cuDiEiH3WrwORvtFMSh99FObQKV8ZWLn-w@mail.gmail.com>
References: <CALo-6+gPAV892XX=cuDiEiH3WrwORvtFMSh99FObQKV8ZWLn-w@mail.gmail.com>
Message-ID: <CAEYzJUGV6mOaq4RLeMrc-V4koRgM=uDGAoRQa+Ux=a+M7Hov3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16 August 2011 20:22, Charles Krinke <charles.krinke@gmail.com> wrote:
> I can see in buildroot/package/busybox/busybox-1.18.x.config which I
> believe is the default .config for busybox. Is that correct?
>
> So, I can go "make busybox-menuconfig" and manipulate the .config and
> then copy my "tuned" .config to
> buildroot/package/busybox/busybox-1.18.x.config and capture the
> changes back in svn and sidestep the fact that clean removes the
> output directories?
>
> Is this the right path for keeping track of a busybox ? ?.config ??

I too do it that way. It's easy and it works.

Best regards,
Bj?rn Forsman
