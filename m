From: Rodrigo Rebello <rprebello@gmail.com>
Date: Mon, 2 Nov 2015 19:33:14 -0200
Subject: [Buildroot] [PATCH 1/1] irssi: new package
In-Reply-To: <20151102220958.67ac934c@free-electrons.com>
References: <1446256581-3010-1-git-send-email-rprebello@gmail.com>
 <20151102220958.67ac934c@free-electrons.com>
Message-ID: <CABLs7GW97yaF9ugR6QgQ5SWe7DuC1D1J2QhpXDPxKUn1Dot5Vw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

No problem. I'll keep an eye on irssi.org and send an update patch
when it comes back online.

Regards,
Rodrigo

2015-11-02 19:09 GMT-02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Rodrigo Rebello,
>
> On Fri, 30 Oct 2015 23:56:21 -0200, Rodrigo Rebello wrote:
>> Irssi is a terminal based IRC client for UNIX systems.
>>
>> http://irssi.org/
>>
>> Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
>> ---
>>  package/Config.in                                  |  1 +
>>  .../0001-Fix-quote-around-macro-argument.patch     | 46 +++++++++++++++++++
>>  package/irssi/Config.in                            | 30 +++++++++++++
>>  package/irssi/irssi.hash                           |  2 +
>>  package/irssi/irssi.mk                             | 52 ++++++++++++++++++++++
>>  5 files changed, 131 insertions(+)
>>  create mode 100644 package/irssi/0001-Fix-quote-around-macro-argument.patch
>>  create mode 100644 package/irssi/Config.in
>>  create mode 100644 package/irssi/irssi.hash
>>  create mode 100644 package/irssi/irssi.mk
>
> I've applied your patch, but I had to temporarily change the IRSSI_SITE
> variable to point to some other site, since irssi.org is currently
> down. Do not hesitate to monitor irssi.org availability, and send a new
> patch changing back the site to irssi.org once it is available again.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
