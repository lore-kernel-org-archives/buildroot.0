From: Matthew Weber <matthew.weber@collins.com>
Date: Tue, 23 Mar 2021 07:54:40 -0500
Subject: [Buildroot] [PATCH v1 1/1] package/nerdctl: new package
In-Reply-To: <20210323051027.91385-1-christian@paral.in>
References: <20210323051027.91385-1-christian@paral.in>
Message-ID: <CANQCQpabm-BFmSKGapR5Fiwu_60O-nvJtWuuVc=41h4d3ZZpbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian,

On Tue, Mar 23, 2021 at 12:11 AM Christian Stewart <christian@paral.in> wrote:
>
> nerdctl is a CLI for containerd (package docker-containerd) which is drop-in
> compatible with the Docker Daemon CLI.

By chance, do you have any rough estimates on the size difference
between the set of GOLang executables between a pure Docker solution
and a containerd+ nerdctl? (If I remember correctly Docker was
200-300MB (engine+CLI))

I saw the other RFC as well for renaming docker-containerd to
containerd, that makes sense to me as the containerd runtime stands
alone and this would make any dependencies cleaner with no reference
to docker-*.

Matt
