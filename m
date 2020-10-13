From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Oct 2020 17:49:15 +0200
Subject: [Buildroot] [PATCH] systemd: add option to enable
 systemd-journal-remote
In-Reply-To: <2fe4a385-5157-bbb0-2cb7-f9af26881b44@heine.tech>
References: <CAJPHfYNGkrW8MWGQyaWgehg_wAQ=3eoNWVZHEh=DyhbebJhJTA@mail.gmail.com>
 <905ca80c-acb2-3118-f829-baeb175e4a6a@heine.tech>
 <20201013173524.56b78792@windsurf>
 <2fe4a385-5157-bbb0-2cb7-f9af26881b44@heine.tech>
Message-ID: <20201013174915.44cf492e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 13 Oct 2020 17:40:19 +0200
Michael Nosthoff <buildroot@heine.tech> wrote:

> # ls -la /usr/lib/systemd/systemd-journal-*
> -rwxr-xr-x 1 root root  25964 Oct 13 14:57
> /usr/lib/systemd/systemd-journal-gatewayd
> -rwxr-xr-x 1 root root  46508 Oct 13 14:57
> /usr/lib/systemd/systemd-journal-remote
> -rwxr-xr-x 1 root root  34144 Oct 13 14:57
> /usr/lib/systemd/systemd-journal-upload

In the context of systemd, these sizes are definitely in the noise
compared to everything else. So I'm fine with a single option that
would enable all 3 tools in one go.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
