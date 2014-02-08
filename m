From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Feb 2014 23:11:09 +0100
Subject: [Buildroot] [PATCH] gdb: move version selection from gdb.mk to
	Config.in.host
In-Reply-To: <1391031881-19546-1-git-send-email-arnout@mind.be>
References: <52E9752E.2020602@mind.be>
 <1391031881-19546-1-git-send-email-arnout@mind.be>
Message-ID: <CACXmVibZjDtnJ1upFy3W2UtxyXa=tExspugFV2XtxqDYoXQXUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 29, 2014 at 10:44 PM, Arnout Vandecappelle
(Essensium/Mind) <arnout@mind.be> wrote:
> This avoids duplication of the version selection between these two files.
>
> Cc: Spenser Gilliland <spenser@gillilanding.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Warning: I have not really tested this!
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

--
Bye, Peter Korsgaard
