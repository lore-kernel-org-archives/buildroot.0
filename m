From: Joachim Wiberg <troglobit@gmail.com>
Date: Thu, 21 Jan 2021 13:45:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/sysklogd: needs threads
In-Reply-To: <20210120173803.90884-1-fontaine.fabrice@gmail.com>
References: <20210120173803.90884-1-fontaine.fabrice@gmail.com>
Message-ID: <87im7qwj9g.fsf@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wed, Jan 20, 2021 at 18:38, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> threads is mandatory since version 2.0 and
> https://github.com/troglobit/sysklogd/commit/f6e17bd6b30397912dcae33842b7aba8d32710a2

Had completely forgotten about that mutex, thanks for fixing this!

> Fixes:
>  - http://autobuild.buildroot.org/results/33846ba0c6746c2befcd3c3ce0bbe0c5b32669ed

I love the autobuilders :)

There should be a link from the front page to them (and perhaps a
redirect from https to http). 

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Acked-by: Joachim Wiberg <troglobit@gmail.com>
