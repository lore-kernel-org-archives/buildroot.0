From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 11 Mar 2013 00:26:48 +0100
Subject: [Buildroot] [PATCH 14/32] qt5base: add eglfs graphics backend
In-Reply-To: <87620yx6f4.fsf@dell.be.48ers.dk>
References: <1362687540-19440-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1362687540-19440-15-git-send-email-thomas.petazzoni@free-electrons.com>
 <87620yx6f4.fsf@dell.be.48ers.dk>
Message-ID: <201303110026.49012.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Thomas, All,

On Sunday 10 March 2013 Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Thomas> ---
>  Thomas>  package/qt5/qt5base/Config.in                      |   11 ++++++-
>  Thomas>  ...nce-add-egl-to-CONFIG-to-get-correct-incl.patch |   32 ++++++++++++++++++++
>  Thomas>  package/qt5/qt5base/qt5base.mk                     |    9 ++++--
>  Thomas>  3 files changed, 49 insertions(+), 3 deletions(-)
>  Thomas>  create mode 100644 package/qt5/qt5base/qt5base-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch
> 
>  Thomas> +++ b/package/qt5/qt5base/qt5base-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch
>  Thomas> @@ -0,0 +1,32 @@
>  Thomas> +From 588c60d0c3d11e79d19860fa62b03c935658d13a Mon Sep 17 00:00:00 2001
>  Thomas> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Thomas> +Date: Sun, 13 Jan 2013 14:36:48 +0100
>  Thomas> +Subject: [PATCH qtbase] eglconvenience: add egl to CONFIG to get correct include
>  Thomas> + paths
>  Thomas> +
> 
> It seems this somehow (before adding to buildroot) got wordwrapped?
> E.G. 'paths' should normally be part of the subject line.

Notice how 'paths' has a space in front of it?
That's the way line continuation is expresed in an e-mail.

I expect (in fact I'm pretty sure) git-am correctly handles this case,
and folds back this part into the previous line, thus restoring the
initial subject line.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
