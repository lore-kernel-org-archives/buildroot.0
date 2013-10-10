From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Oct 2013 08:49:05 +0200
Subject: [Buildroot] [PATCH] libxmlrpc: new package
In-Reply-To: <CAAXf6LUo7nVgHoRNy5aqseXEijPACxsp7NwVJSUQ-q_bQR0VMw@mail.gmail.com>
References: <CAM+bi4vJbFEGdDKMjJxesqR8T=g=KQkgeZpaLNy=1L_FsDkrPA@mail.gmail.com>
 <1381320976-948-1-git-send-email-alvaro.gamez@hazent.com>
 <CAAXf6LUo7nVgHoRNy5aqseXEijPACxsp7NwVJSUQ-q_bQR0VMw@mail.gmail.com>
Message-ID: <52564DE1.5020009@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/09/13 15:09, Thomas De Schampheleire wrote:
> Hi Alvaro,
>
> On Wed, Oct 9, 2013 at 2:16 PM, Alvaro G. M<alvaro.gamez@hazent.com>  wrote:
>> >Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
>> >Signed-off-by: Alvaro G. M<alvaro.gamez@hazent.com>
>> >---
>> >  package/Config.in                                  |  1 +
>> >  package/libxmlrpc/Config.in                        | 10 ++++++++
>> >  .../libxmlrpc-01-fix-gennmtab-build.patch          | 25 ++++++++++++++++++
>> >  .../libxmlrpc-02-fix-non-cplusplus-build.patch     | 27 +++++++++++++++++++
>> >  .../libxmlrpc/libxmlrpc-03-non-wchar-build.patch   | 24 +++++++++++++++++
>> >  .../libxmlrpc-04-use-correct-curl-config.patch     | 22 ++++++++++++++++
>> >  package/libxmlrpc/libxmlrpc.mk                     | 30 ++++++++++++++++++++++
>> >  7 files changed, 139 insertions(+)
>> >  create mode 100644 package/libxmlrpc/Config.in
>> >  create mode 100644 package/libxmlrpc/libxmlrpc-01-fix-gennmtab-build.patch
>> >  create mode 100644 package/libxmlrpc/libxmlrpc-02-fix-non-cplusplus-build.patch
>> >  create mode 100644 package/libxmlrpc/libxmlrpc-03-non-wchar-build.patch
>> >  create mode 100644 package/libxmlrpc/libxmlrpc-04-use-correct-curl-config.patch
>> >  create mode 100644 package/libxmlrpc/libxmlrpc.mk
> We have had a long discussion on two buildroot developer days about
> the format of the number in patch names. I thought we had decided to
> use a four-digit format to correspond to the patches generated with
> git. So this should be 0001, 0002, etc.
> However, this may be mis-remembered by me, so I'm including some of
> the people involved in that discussion to this mail...

  AFAICR we concluded that it wasn't necessary to enforce four digits, 
since very few of the patches are generated from git anyway.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
