From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Dec 2017 13:45:47 +0100
Subject: [Buildroot] [PATCH v2 1/1] tpm-tools: bump to version 1.3.9.1
In-Reply-To: <1513679676-17188-1-git-send-email-yairba@tkos.co.il>
References: <1513679676-17188-1-git-send-email-yairba@tkos.co.il>
Message-ID: <20171219134547.70fae97f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for the improved commit log.

On Tue, 19 Dec 2017 12:34:36 +0200, Yair Ben Avraham wrote:

>  - Revert to pkcs11 support. Building src/data_mgmt directory depends on
>    P11_SUPPORT which in turn depends on opencryptoki/pkcs11.h header and it's
>    not a make issue

I don't understand this part however. Could you explain a bit more ?
What do you mean by "it's not a make issue" ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
