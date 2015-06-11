From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Thu, 11 Jun 2015 16:41:22 -0400
Subject: [Buildroot] [PATCH v3 1/3] atf: new package
In-Reply-To: <20150611223430.47b7fb18@free-electrons.com>
References: <1433717727-30214-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>	<1433717727-30214-2-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
 <20150611223430.47b7fb18@free-electrons.com>
Message-ID: <5579F272.4070109@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas.

I do not know a lot about licenses, so it will be a lucky mistake if
it's correct otherwise i can add the BSD-2c if you think it's required.

Thanks.

On 06/11/2015 04:34 PM, Thomas Petazzoni wrote:
> Dear Sebastien Bourdelin,
>
> On Sun,  7 Jun 2015 18:55:25 -0400, Sebastien Bourdelin wrote:
>
>> +ATF_VERSION = 0.21
>> +ATF_SITE = https://github.com/jmmv/atf/releases/download/atf-$(ATF_VERSION)
>> +ATF_INSTALL_STAGING = YES
>> +ATF_LICENSE = BSD-3c
> The COPYING file actually has both BSD-2c and BSD-3c. Maybe specifying
> only BSD-3c is OK since it's the same as BSD-2c + an additional
> restriction. But I was just wondering what lead to mentioning only
> BSD-3c.
>
> Thanks,
>
> Thomas
