From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 30 Oct 2020 09:25:01 +0100
Subject: [Buildroot] [PATCH] package/libgpiod: bump version to 1.6
In-Reply-To: <57-5f9bc680-3-4a87f08@125885651>
References: <CAMRc=MfTQ4o8TTV6UDR27dGBPqbUJA9EAFykdO0Rb3LDjp4Gkw@mail.gmail.com>
 <57-5f9bc680-3-4a87f08@125885651>
Message-ID: <CAMRc=MdGv3dUJXy7ZMXfuWrw+LcXdWia5uGKO8P0XTEabggjWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 30, 2020 at 8:53 AM Michael Nosthoff <buildroot@heine.tech> wrote:
>
> Hi,
>
> On Thursday, October 29, 2020 14:41 CET, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> >
> > v2.0 of libgpiod will no longer support older kernels but I'll support
> > v1.6 indefinitely for older kernels and v1.4 as long as v5.4 is
> > supported.
>
> Will 1.4.x still work with 5.10 kernels? I guess the old API will just be deprecated for a while?
>

Yes! Newer kernels won't break older versions of the library.

> So I guess we have two possibilities going forward:
>
> - Use the version switch I proposed and even extend it when 2.0 and headers 5.10 are released
> or
> - Stay on the 1.4.x branch until linux 5.5 is the oldest supported version (if this is possible).
>
> Regards,
> Michael
>

I'd say: stay on v1.4.x branch until the end of v5.4 LTS and then
introduce v2.0 as soon as it's available just like there's
gstreamer(0) and gstreamer1.0.

Bartosz
