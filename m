From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 18 Jun 2008 00:58:30 -0300
Subject: [Buildroot] [PATCH] Fix proftpd compile with recent kernels.
In-Reply-To: <d6cda7730806172032n7a564bc7g409d2bbe18c1d471@mail.gmail.com>
References: <d6cda7730806172032n7a564bc7g409d2bbe18c1d471@mail.gmail.com>
Message-ID: <d6cda7730806172058v708be481y167b834a4367834b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

*resubmit*

Missing rule to apply patch in .mk file and change patch to apply with -p1

It now works properly. Please, don't forget to:

svn add package/proftpd/proftpd-1.3.1*

It also seams that the bzero patch is no longer necessary (built fine
for me using atngw100_defconfig)

On Wed, Jun 18, 2008 at 12:32 AM, Thiago A. Corr?a
<thiago.correa@gmail.com> wrote:
> ProFTPd fails to compile with kernels 2.6.24+
>
> This patch bumps it to version 1.3.1 and applies a patch from gentoo
> bugtracker #218850 (http://bugs.gentoo.org/show_bug.cgi?id=218850)
>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: fix-proftpd-compile.patch
Type: application/octet-stream
Size: 2625 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080618/00251bca/attachment.obj 
