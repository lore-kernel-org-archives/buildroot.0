From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 13 Mar 2015 22:19:32 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/unixodbc: new package
References: <1426278306-21589-1-git-send-email-bernd.kuhls@t-online.de>
 <20150313220351.5dce9aa3@free-electrons.com>
Message-ID: <XnsA45CE31BE311BberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20150313220351.5dce9aa3 at free-electrons.com:

> Hum, could we instead get a solution that could potentially be
> upstreamed? Like using AC_CACHE_CHECK(), or something like that.

this is beyond my capabilities, but maybe it is not needed...

> Also, any reason to patch configure directly? We normally don't do
> that, and always prefer to patch configure.{in,ac}.

Yes, autoreconf would need to patch Makefile.am so I chose not to go this 
way.

> That being said, if you don't care about no-thread support in unixodbc,
> I would personally be fine if you decided to add 'depends on
> BR2_TOOLCHAIN_HAS_THREADS' in Config.in.

Ok, will send a patch in the next days. I just wanted to include the package 
with as few dependencies as possible.

Regards, Bernd
