From: Christian Stewart <christian@paral.in>
Date: Fri, 04 Mar 2016 18:37:37 +0000
Subject: [Buildroot] [PATCH v2 0/3] Add go language support
In-Reply-To: <cover.1457115561.git.geoff@infradead.org>
References: <cover.1457115561.git.geoff@infradead.org>
Message-ID: <CA+h8R2phbtsNPge-VmpuXqYsv1N3cy3ChAFPfJrn6bxNi+HmvQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Geoff,

On Fri, Mar 4, 2016 at 1:22 PM Geoff Levand <geoff@infradead.org> wrote:
> Patch 3 adds a go language package flannel that can be used to test the go
compiler.

This patch series looks good, nice and clean. Interesting that you chose to
include Flannel. This indicates to me that you've worked a bit on creating
a Docker package as well. Is that the case?

Here's my previous implementation:
https://github.com/paralin/buildroot/commit/b3cb1b334c1a23136e77ea7d34aafb24e8a186db

I have around ~20 commits with docker utilities on top of that as well.

I'm still working on testing this series, and will send my ack once I know
everything's working. I probably will make a new branch in my repo and
rebase everything on top of this series.

Best,
Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160304/6ab367d6/attachment.html>
