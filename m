From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Fri, 10 Aug 2012 22:52:12 -0400
Subject: [Buildroot] [PATCH] Add package linux-pam
In-Reply-To: <20120810220424.7aba837f@skate>
References: <1344569575-25960-1-git-send-email-golubovsky@gmail.com>
 <20120810094139.12fbf1f2@skate>
 <CADiAo4+Ak_6ZLY0ND=ZYWz6wTsov4XnkpXvbK8ZSF-ukU7ALGw@mail.gmail.com>
 <20120810220424.7aba837f@skate>
Message-ID: <CADiAo4JAFBkemNO6AM8Kpx_8LObeyimFA6GZXXdPUCaYGQAqMg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, Aug 10, 2012 at 4:04 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

> Try this instead:
>
> ifeq ($(BR2_PACKAGE_LIBINTL),y)
> LINUX_PAM_MAKE_OPT += LIBS=-lintl
> endif

Thanks, this works.

Patch resubmitted.

-- 
Dmitry Golubovsky

Anywhere on the Web
