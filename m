From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Sat, 14 Jul 2018 11:55:15 -0700
Subject: [Buildroot] Fwd: Guide for installing Chromium using patch sets
In-Reply-To: <CAD0+TpAFG3X6=MO5VQMcvHRz-JNiEUv31Agr__JFmox9UAc90g@mail.gmail.com>
References: <CAD0+TpAc6473JO3H24CLwxUwc0WXZ5n8es1xJctnyhUEESrwWg@mail.gmail.com>
 <CAMWSM7iJjfVUY_Yw13u+gg73eShK5pwh5+1yawWRV+Z-qAhGTw@mail.gmail.com>
 <CAD0+TpAfAu0XKeEzwhACV8j0D-27fodEhFjgg9JcgePs-7Nxgg@mail.gmail.com>
 <CAMWSM7hLA6p+MqQW0MVrf8DZ6A5Ap8UqO_xPo8hW5QMvjirrDQ@mail.gmail.com>
 <CAD0+TpAX_eSnF70YLRq6Kp44iySE4O18gxSu23bcjOHjDsSQWA@mail.gmail.com>
 <CAD0+TpC5N2DW8sfs38GAAy5=hbAf6uccHTGMxSt+AjPQmdUqbQ@mail.gmail.com>
 <CAD0+TpAFG3X6=MO5VQMcvHRz-JNiEUv31Agr__JFmox9UAc90g@mail.gmail.com>
Message-ID: <CAMWSM7hfQ-yBqPMZis_1bEn4igGByV4v4EWqW5n_7Dnf5x8kpA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fame,

On Wed, Jul 11, 2018 at 9:24 AM Fame Castle <famecastle@gmail.com> wrote:
>
> I did a 'make chromium-dirclean all' and the problem reappeared. You can find my buildroot config file at https://pastebin.com/zjZuDgB3 . The libnss package is selected in buildroot. "chromium 67.0.3396.79" gets downloaded successfully, all patches are applied correctly and the configuration fails with the same error.

Thanks for sending your config, I was able to reproduce your problem.
I've fixed this issue, and identified and fixed a few others for the
next version of this patchset.

You can find my current work in the chromium-v7-wip branch at
https://github.com/jakogut/buildroot.

I haven't sent an updated patchset to the mailing list yet; your
config is having linking problems at the end of the build, and I'm
still working on a solution.

Here's the output of that build.

https://gist.github.com/jakogut/b05bd63c1e3b2ca823fd6b08ed3f0d2e
