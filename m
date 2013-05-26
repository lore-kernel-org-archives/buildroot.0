From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 May 2013 15:20:08 +0200
Subject: [Buildroot] [PATCH] poco: Add upstream patch to add support for
 aarch64.
In-Reply-To: <CAFbHwiTLP2KRtYo=wvG2EJdR=Uf7r1BeZb+S8=BFbJ1_8PyqEw@mail.gmail.com>
References: <CAFbHwiTLP2KRtYo=wvG2EJdR=Uf7r1BeZb+S8=BFbJ1_8PyqEw@mail.gmail.com>
Message-ID: <20130526152008.79ce67ec@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Will Newton,

On Wed, 22 May 2013 11:49:30 +0100, Will Newton wrote:
> Signed-off-by: Will Newton <will.newton@linaro.org>
> ---
>  package/poco/poco-aarch64.patch | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/poco/poco-aarch64.patch

Thanks, I've applied and tested that one here, after making the
necessary changes following 1c3afe4bc14a55aa491be270c24f31d1c5d4d8f1.

I will send the patch as part of a pull request to Peter later today.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
