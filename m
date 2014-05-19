From: Frank Bergmann <frank@frajasalo.de>
Date: Mon, 19 May 2014 21:34:44 +0200
Subject: [Buildroot] [PATCH 1/1] fio: fix missing fallocate64()
In-Reply-To: <20140512214442.014f1eb5@free-electrons.com>
References: <1399668168-4521-1-git-send-email-frank@frajasalo.de>
 <20140512214442.014f1eb5@free-electrons.com>
Message-ID: <537A5CD4.70500@frajasalo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 12.05.2014 21:44, Thomas Petazzoni wrote:
> Dear Frank Bergmann,
>
> On Fri,  9 May 2014 22:42:48 +0200, Frank Bergmann wrote:
>
>> +ifeq ($(BR2_nios2),y)
>> +BR2_GLOBAL_PATCH_DIR += "board/common-nios2"
>> +endif
>
> Unfortunately, we don't want to have architecture-specific patches, and
> not applied with this mechanism.

Sorry I didn't take notice of that.
Maybe someone could edit chapter 3.4.4 "Customizing packages"
(http://buildroot.org/downloads/manual/manual.html#packages-custom)
where such architecture-specific patches are mentioned to avoid
misinterpreting it like I did.

With regards,
Frank Bergmann.
