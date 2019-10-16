From: Carlos Santos <unixmania@gmail.com>
Date: Tue, 15 Oct 2019 22:07:35 -0300
Subject: [Buildroot] beaglebone_qt5 does not build since commit
 a7914499b80
In-Reply-To: <721fdd74aa2924a78ba869d8be54dfb03487c7e5.camel@gmail.com>
References: <CAJ4jsae64FAUnKVqj2wEbYpEaLC31=gJuZuGCV3ZLjLbOP6djQ@mail.gmail.com>
 <cbf93c1c-0a4a-79d4-6ebd-5d26f37d3c23@gmail.com>
 <20191013154223.60ede697@windsurf>
 <406efb70-4eba-09f6-9c09-939f8f768c02@gmail.com>
 <740C8925-BCBC-4A77-AF69-68E7AE607B92@gmail.com>
 <721fdd74aa2924a78ba869d8be54dfb03487c7e5.camel@gmail.com>
Message-ID: <CAJ4jsaffJ_P=3kwyr37vasqnQRj489f09WUgUv8TzzE8aw07PA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 15, 2019 at 6:31 PM Lothar Felten <lothar.felten@gmail.com> wrote:
>
> On Sun, 2019-10-13 at 11:57 -0300, Carlos Santos wrote:
> > I have a beaglebone black and can make some experiments this week.
>
> Hello Carlos,
>
> I have four patches, they allow you to build a new kernel, kernel
> module and userspace tools including libgbm for the beaglebone with the
> current toolchain.
> You can run the GLES(1) demos, I had no success with the GLES2 demos.
> The last patch is for qt5base, but it is incomplete, it won't compile
> the qpa backend yet.
> I'll post the four patches with RFC prefix to the list.
>
> Best regards,
> Lothar

Thanks. I will test them as time permits.

-- 
Carlos Santos <unixmania@gmail.com>
