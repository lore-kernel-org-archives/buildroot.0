From: Christian Stewart <christian@paral.in>
Date: Thu, 30 Jul 2015 23:13:10 +0000
Subject: [Buildroot] GNU Coreutils Cut Bug
Message-ID: <CA+h8R2rKT2qWkV7nmA+EyidOZuE+vT_8cGN8eb0wXfNqoS=U-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

I'm using `cut (GNU coreutils) 8.24`.

The command: `echo "TEST=test" | cut -d"=" -f2-` outputs `Ttest`. I don't
think this is the intended behavior. It should output "test".

Am I using it wrong or is there something wrong with coreutils?

Thanks,
Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150730/728f82df/attachment.html>
