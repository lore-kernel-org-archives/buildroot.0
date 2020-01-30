From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 30 Jan 2020 18:45:11 +0200
Subject: [Buildroot] [PATCH 1/2] package/webkitgtk: security bump to
 version 2.26.3
In-Reply-To: <20200128072323.9204-1-peter@korsgaard.com>
References: <20200128072323.9204-1-peter@korsgaard.com>
Message-ID: <20200130184511.GB140676@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 28 Jan 2020 08:23:21 +0100, Peter Korsgaard <peter@korsgaard.com> wrote:
> Fixes the following security issues:
> 
> - CVE-2019-8835: Multiple memory corruption issues were addressed with
>   improved memory handling
> 
> - CVE-2019-8844: Multiple memory corruption issues were addressed with
>   improved memory handling
> 
> - CVE-2019-8846: A use after free issue was addressed with improved memory
>   management
> 
> For details, see the advisory:
> https://webkitgtk.org/security/WSA-2020-0001.html
> 
> Drop now upstreamed patch.

Thanks a lot for doing these version bumps. I've been a few days off and
was planning to submit patches today, when I suddenly noticed that the
packages had already been updated. Nice!

?Adri?n


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200130/db7a12da/attachment.asc>
