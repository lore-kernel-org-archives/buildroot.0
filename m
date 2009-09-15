From: Anders Darander <anders.darander@gmail.com>
Date: Tue, 15 Sep 2009 11:02:05 +0200
Subject: [Buildroot] [PATCH] DNS resolv problem with glibc
In-Reply-To: <873a6o3dk9.fsf@macbook.be.48ers.dk>
References: <20090915061256.GA9451@gmail.com>
	<873a6o3dk9.fsf@macbook.be.48ers.dk>
Message-ID: <2c9a759f0909150202i605ee351l1b4e8a01be528354@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 15, 2009 at 08:52, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Anders" == Anders Darander <anders.darander@gmail.com> writes:
> ?Anders> -EXTERNAL_LIBS+=ld-linux.so libnss_files.so
> ?Anders> +EXTERNAL_LIBS+=ld-linux.so libnss_files.so libnss_dns.so
> ?Anders> ?endif
> ?Anders> ?ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
>
> Your MTA seems to have swallowed the empty line above the LIBSTDCPP
> line, causing the patch to not apply. Please check your settings.
>

Hm, yep, that seems strange.
I'll have look into that...

Thanks for applying the patch anyway!

Regards,
Anders

-- 
Anders Darander
