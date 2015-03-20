From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 20 Mar 2015 14:25:06 +0100
Subject: [Buildroot] [PATCH 06/15] avahi: systemd cleanups
In-Reply-To: <20150320141546.702ace0c@free-electrons.com>
References: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
 <1426787807-29510-7-git-send-email-mike@mikebwilliams.com>
 <20150320141546.702ace0c@free-electrons.com>
Message-ID: <CAHXCMM+F+JFRftpfREL8dEa5D0sL_SdecDrrD+9Yzrv9jgf6Gw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 20, 2015 at 2:15 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Mike Williams,
>
> On Thu, 19 Mar 2015 13:56:38 -0400, Mike Williams wrote:
>
>> +ifneq ($(BR2_PACKAGE_SYSTEMD),y)
>> +AVAHI_EXTRA_CFLAGS += -DDISABLE_SYSTEMD
>> +endif
>
> This cannot work, since AVAHI_EXTRA_CFLAGS is not used by anything.
>
> I'm surprised you got a Reviewed-by from Samuel and Steven with this
> big issue.

argh! right! I missed that :-s


-- 
Samuel
