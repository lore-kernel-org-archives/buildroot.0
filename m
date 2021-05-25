From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 25 May 2021 20:18:02 +0200
Subject: [Buildroot] [PATCH] package/grpc: restrict host-grpc to the
 absolute minimum
In-Reply-To: <87a6oiu4qs.fsf@tarshish>
References: <20210525165602.18943-1-patrickdepinguin@gmail.com>
 <87a6oiu4qs.fsf@tarshish>
Message-ID: <CAAXf6LWAwbvkb6B4WrKR0qDwvcKwEeNoZToXPzAszf5KNvfM_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El mar, 25 may 2021 a las 19:02, Baruch Siach (<baruch@tkos.co.il>) escribi?:
>
> Hi Thomas,
>
> On Tue, May 25 2021, Thomas De Schampheleire wrote:
> > @@ -20,10 +19,9 @@ config BR2_PACKAGE_GRPC
> >
> >         http://github.com/grpc/grpc
> >
> > -comment "grpc needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.9, host gcc >= 4.9"
> > +comment "grpc needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.99"
>
> Extra '9' here.

Thanks Baruch.
This update of the Config.in comment was a last-minute change. (The
real code is already used for a few months in our work repo).

I'll send a v2.

Best regards,
Thomas
