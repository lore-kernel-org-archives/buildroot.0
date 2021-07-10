From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Sat, 10 Jul 2021 18:57:22 +0200
Subject: [Buildroot] BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM
In-Reply-To: <CAKAnv4HGYt2Oz8BdsWA3RaZK-UO3qckbSX95W68oKRXDPy5fHg@mail.gmail.com>
References: <CAKAnv4HGYt2Oz8BdsWA3RaZK-UO3qckbSX95W68oKRXDPy5fHg@mail.gmail.com>
Message-ID: <58A8CA1D-00D4-439B-8783-4B2B684F5F29@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ivan!

bouncing to the buildroot list..
Should be possible I'd say but folks here will know that in more detail.
thanks,

On 8 July 2021 13:55:21 CEST, Ivan Riabtsov <ivriabtsov@gmail.com> wrote:
>Hello everybody. I am building a filesystem for embedded hardware
>using buildroot version 2018.02.4. I am building kernel 5.10.48, in
>the dump system the maximum version of variable
>BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM is 4_15. Is it possible to build
>a normal filesystem using the
>BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15 variable and 5.10 kernel? I
>do not want to take a fresh build of buildroot, because my patches for
>buildroot are only for version 2018.02.4 and I do not know if they
>will work for a more recent version. Thank you for your response.
>_______________________________________________
>busybox mailing list
>busybox at busybox.net
>http://lists.busybox.net/mailman/listinfo/busybox
