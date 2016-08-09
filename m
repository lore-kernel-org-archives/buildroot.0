From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 09 Aug 2016 22:15:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/libsidplay2: broken with gcc6
References: <1470771855-12987-1-git-send-email-bernd.kuhls@t-online.de>
 <B397AE0E-28F2-4D0D-866B-3FD929EFB1DC@gmail.com>
 <20160809220419.36e61b43@free-electrons.com>
Message-ID: <c7qp7dxll8.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 09 Aug 2016 22:04:19 +0200 schrieb Thomas Petazzoni:

> Hello,
> 
> On Tue, 9 Aug 2016 12:52:29 -0700, Khem Raj wrote:

>> This could also be fixed in code instead to statically typecast to int8_t.
> 
> I would also very much prefer to see the code being fixed, rather than
> this weird !AT_LEAST_GCC_6 dependency being added.

Hi Thomas,

ok, but I am unable to provide such a patch because I
do not know what to code to fix the C stuff ;)

Regards, Bernd
