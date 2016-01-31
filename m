From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2016 10:03:03 +0100
Subject: [Buildroot] [PATCH 1/1] merge_config.sh: create temporary files
 in /tmp
In-Reply-To: <1449497325-5148-1-git-send-email-casantos@datacom.ind.br>
References: <1449497325-5148-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <CACXmViadN49zyo_PjRQvVGWspfTyKHMZb8Ta6ctQnNNZm74smg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 7, 2015 at 3:08 PM, Carlos Santos <casantos@datacom.ind.br> wrote:
> From: Henrique Marks <henrique.marks@datacom.ind.br>
>
> Creating temporary files in /tmp (or the path pointed by $TMPDIR) allows the
> buildroot top directory to be read-only and shareable between multible builds.
> This follows what other scripts do, e.g. check-kernel-headers.sh.
>
> Signed-off-by: Henrique Marks <henrique.marks@datacom.ind.br>
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

Committed, thanks.
