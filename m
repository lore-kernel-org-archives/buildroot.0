From: Christian Stewart <christian@paral.in>
Date: Mon, 04 Jul 2016 16:16:43 +0000
Subject: [Buildroot] [PATCH v6 3/3] docker-engine: new package
In-Reply-To: <a711b084-add6-8698-5cb7-ddf4bfeaf317@gmail.com>
References: <1464475578-22239-1-git-send-email-christian@paral.in>
 <1464475578-22239-4-git-send-email-christian@paral.in>
 <a711b084-add6-8698-5cb7-ddf4bfeaf317@gmail.com>
Message-ID: <CA+h8R2rXS2TgsDk_6sLSD4-ZuWtVc2QV=V1=tueLsNje+4hDfQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Mon, Jul 4, 2016, 9:13 AM Romain Naour <romain.naour@gmail.com> wrote:

> This script clone dozen git repository
>

That script is unnecessary and I have removed it in my newer version of
this series. It's intended to be called by developers to update the vendor
tree, not at build time.

Christian

>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160704/ac5a51a7/attachment.html>
