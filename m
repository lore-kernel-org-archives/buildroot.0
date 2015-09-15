From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 15 Sep 2015 16:03:53 +0200
Subject: [Buildroot] [PATCH v3 1/1] docs/website: contribute.txt update
 with useful tips on patch versioning and patch submission
In-Reply-To: <1441727239-17284-1-git-send-email-francesco.nwokeka@gmail.com>
References: <1441726084-15422-1-git-send-email-francesco.nwokeka@gmail.com>
 <1441727239-17284-1-git-send-email-francesco.nwokeka@gmail.com>
Message-ID: <CAHkwnC_ZSEETW19H-4tKNcpr3z7XGn7Fu9iuCi4kbMROjgGQtg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 8, 2015 at 5:47 PM, Francesco Nwokeka <
francesco.nwokeka@gmail.com> wrote:

> Added an alternative on patch versioning (the -v option) and added a tip
> on how to automatically mark a previous commit as superseded
>
> Signed-off-by: Francesco Nwokeka <francesco.nwokeka@gmail.com>


<snip>

+You can also add the +--in-reply-to <message-id>+ flag when
> +submitting a patch to the mailing list. The id of the mail
> +to reply to can be found under the "Message Id" tag on
> +http://patchwork.buildroot.org[patchwork].
> +The advantage of *in-reply-to* is that patchwork will automatically mark
> the
> +previous patch as superseded.
> +
>

I've sent the "[PATCH v2] barebox: bump to version 2015.09.0"(
http://lists.busybox.net/pipermail/buildroot/2015-September/139495.html)
using the --in-reply-to option of format-patch, but patchwork didn't make
the v1 as superseded, I've done something wrong?

v2: http://patchwork.ozlabs.org/patch/517503/
v1: http://patchwork.ozlabs.org/patch/517494/

Best regards
-- 
Fabio Porcedda
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150915/97a9e518/attachment.html>
