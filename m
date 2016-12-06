From: Brandon Maier <brandon.maier@rockwellcollins.com>
Date: Tue, 6 Dec 2016 11:22:07 -0600
Subject: [Buildroot] [PATCH v2 0/4] support/download/git using git fetch
In-Reply-To: <20161202152123.20399-1-ricardo.martincoski@datacom.ind.br>
References: <20161202152123.20399-1-ricardo.martincoski@datacom.ind.br>
Message-ID: <CA+fik513NUzKJXGfD_NA+Vvh-2vLBZDJoZ1O4EC-xBnAj4B95Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for incorporating the shallow fetch into your patch. The full
rewrite to git init/fetch ended up with a much cleaner implementation then
trying to hack my stuff onto git clone.

I tested these 4 patches on some of our internal projects and it brought a
fresh "make source" from 9.1m down to 1.8m.

Tested-by: Brandon Maier <brandon.maier@rockwellcollins.com>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161206/68d2773f/attachment.html>
