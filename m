From: Mircea Gliga <gliga.mircea@gmail.com>
Date: Mon, 23 Sep 2019 13:22:28 +0300
Subject: [Buildroot] [PATCH 1/1] package/libssh: add support for mbedtls
 crypto backend
In-Reply-To: <20190923092218.72ad7121@windsurf.home>
References: <20190918110609.7172-1-gliga.mircea@gmail.com>
 <20190918174859.1627727d@windsurf>
 <CAKpO6uFOE2ShN1JupQoiupNF-SVnWzMiJ5x9twcAueGG5p9how@mail.gmail.com>
 <20190923092218.72ad7121@windsurf.home>
Message-ID: <CAKpO6uHe017t7F34v8mjaCm-6GxpRJEuNX7uvzwSrEycrDd_5w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Sorry for the misunderstanding, I re-read your question.

> My point was: is it really useful to
> provide an explicit choice vs. simply selecting a preferred crypto
> provider automatically, with no explicit choice in Config.in.

Yes it's useful if for some reason you have multiple backends already
present: for example one package has a hard dependency on openSSL and I
want mine to use libssh with mbedTLS. In this case you have to manually
choose your crypto backend as the default is not suitable for your needs.

Best regards
Mircea
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190923/23a09665/attachment.html>
