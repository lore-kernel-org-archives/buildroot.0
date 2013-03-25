From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 25 Mar 2013 12:22:35 +0100
Subject: [Buildroot] Fix copying of dotfiles in /
In-Reply-To: <51503194.2090101@arved.at>
References: <51503194.2090101@arved.at>
Message-ID: <CAAXf6LVEZr41V=zTcFiAQ_W5mGc4TUkfam5Cxf5Ud4JcePKiAw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,


On Mon, Mar 25, 2013 at 12:14 PM, Tilman Keskin?z <arved@arved.at> wrote:

> An Example is /.init_enable_core to enable coredumps
>
>
>
> thanks to Snaps@#buildroot for the idea of solving this with rsync.
>
>
Thanks for your mail, such contributions are very welcome!
However, here are a few comments:

- patches should be sent directly in the e-mail, not as attachment. If you
use a version control system, you can easily sent e-mails directly from
that (for example with git format-patch, hg email, ...)

- A patch should contain a clear description. I think the description is
currently a bit short, it would be better if you explain the problem you
are solving in more detail.

- A patch should contain a Signed-off-by line with your name and e-mail
address, below the description. For example:
Signed-off-by: Tilman Kesikn?z <arved@arved.at>


Could you resend the patch according to these rules?

Thanks,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130325/212b3b90/attachment.html>
