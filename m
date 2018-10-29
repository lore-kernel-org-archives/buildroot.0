From: Christian Stewart <christian@paral.in>
Date: Mon, 29 Oct 2018 09:40:44 -0700
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-10-28
In-Reply-To: <20181029070026.A6EF0209B0@mail.bootlin.com>
References: <20181029070026.A6EF0209B0@mail.bootlin.com>
Message-ID: <CA+h8R2pcuGTzowu+S4-cerB07PVs0obsZHQKDhB+=R_MrN6=qg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Oct 29, 2018 at 12:00 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
>       x86_64 |       docker-containerd-v1.1.3 | http://autobuild.buildroot.net/results/9f8ac26c691b699ac9953c5a6f5ec42f1b50e55e
>       x86_64 |      docker-engine-v17.05.0-ce | http://autobuild.buildroot.net/results/16b07236e62a1f334e3a6a7708faf909e3c7f677
>       x86_64 |      docker-engine-v17.05.0-ce | http://autobuild.buildroot.net/results/816b4162daf30842bfe261e4fa42493fdd3fbb3a
>       x86_64 |      docker-engine-v17.05.0-ce | http://autobuild.buildroot.net/results/5c921fc04bc7bbdfee08451e270cf8a6ddb569d5

These are the same "invalid operation" Go compiler bug that we have
seen before. I will investigate if updating Go fixes the issue, and
spin a patch. for 1.11.1.

In the meantime, has there been any further consideration to this
patch, which affects both of these packages:

 - https://patchwork.ozlabs.org/patch/969253/

Thanks,
Christian
