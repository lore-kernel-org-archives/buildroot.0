From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 27 Jun 2020 19:18:25 +0200
Subject: [Buildroot] Cannot build glibc for ARM with GCC10
In-Reply-To: <20200627164322.79ff2cad@windsurf>
References: <CAGm1_kti3EuVpDUMKcuHfLfpKoRhBwKbzxte9NncjNgmpn7qyg@mail.gmail.com>
 <20200627164322.79ff2cad@windsurf>
Message-ID: <CAGm1_ku8d5Gy5haB5CQow=kntoyboQ5SZBmYUp51kpggjxKZng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Jun 27, 2020 at 4:43 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Fri, 26 Jun 2020 18:51:57 +0200
> Yegor Yefremov <yegorslists@googlemail.com> wrote:
>
> > I just wanted to test GCC10 with glibc and encountered the following error:
>
> Did you try with the updated glibc version, provided by the following
> patch series:
>
> https://patchwork.ozlabs.org/project/buildroot/list/?series=182049

The patch series has solved my problem.

Thanks.

Regards,
Yegor
