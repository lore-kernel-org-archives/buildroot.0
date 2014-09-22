From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 22 Sep 2014 23:31:30 +0200
Subject: [Buildroot] strange error
In-Reply-To: <CALo-6+iBsDLxAZib5pxREprPWP-Nr02kNf-pug3=nE=KFMVP7Q@mail.gmail.com>
References: <CALo-6+iBsDLxAZib5pxREprPWP-Nr02kNf-pug3=nE=KFMVP7Q@mail.gmail.com>
Message-ID: <CAHXCMMJRbJ1ZySGsduDqfSzotdPo8Y+JWczg9VN3K8RQ-a5j+g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Charles,

On Mon, Sep 22, 2014 at 11:23 PM, Charles Krinke
<charles.krinke@gmail.com> wrote:
> Gentlemen:
>
> One of my developers is reporting a strange error when building our
> buildroot rootfs and thinks it is related to Ubuntu changes.
>
> Has anyone seen this error and can perhaps tell me what is going on??
>
> stdio.h:456:1: error: 'gets' undeclared here (not in a function)

It reminds me a (very) old bug, fixed back in July 2012.
As references, see:
http://lists.busybox.net/pipermail/buildroot/2012-July/055999.html
http://lists.busybox.net/pipermail/buildroot/2012-July/056000.html

Hope this help.

Regards,

-- 
Samuel
