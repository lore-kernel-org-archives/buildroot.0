From: Mike Williams <mike@mikebwilliams.com>
Date: Tue, 21 Apr 2015 09:52:25 -0400
Subject: [Buildroot] [PATCH v2 1/2] systemd: add option to enable kdbus
	support
In-Reply-To: <CALq67GAML7sJTfiWamfnfXmvvsLecSMLe-3yWCK=o48yHyBekw@mail.gmail.com>
References: <1428271811-27530-1-git-send-email-ryanbarnett3@gmail.com>
 <20150406050422.GD2183@tarshish>
 <CALq67GAML7sJTfiWamfnfXmvvsLecSMLe-3yWCK=o48yHyBekw@mail.gmail.com>
Message-ID: <CANPyyuOrNQ1HfNzKygK0Bzz7pFi3mRqPpf-M8ViNgvVixQhXAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

Tested-by: Mike Williams <mike@mikebwilliams.com>

>> Is there any reason not to enable kdbus when the kernel supports that? If not,
>> I'd suggest to add --enable-kdbus unconditionally, and remove
>> BR2_PACKAGE_SYSTEMD_KDBUS.
>
> In the future, I would agree with this. However, as I stated above, it
> appears that systemd can be compiled with kdbus support without having
> the kernel side feature enabled. With kdbus in systemd being able to
> enabled with the kernel kdbus support, I would be in favor of keeping
> this BR2_PACKAGE_SYSTEMD_KDBUS option.

I'm actually using this patch as is, and it works for me. I also do
not have kdbus enabled in the kernel, and am only using this support
to get additional libraries provided by systemd for

Thanks,
Mike
