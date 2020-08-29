From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Aug 2020 00:46:49 +0200
Subject: [Buildroot] [PATCH/next 1/3] package/spandsp: bump version to
 3.0.0
References: <20200829204005.2815997-1-bernd.kuhls@t-online.de>
 <20200829225602.14aa4647@windsurf.home>
Message-ID: <pf2r1hx7vr.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

>> +SPANDSP_VERSION = 3.0.0-6ec23e5a7e
> 
> What is even more weird is that https://files.freeswitch.org/downloads
> /libs/ shows two 3.0.0 versions:
> 
>   spandsp-3.0.0-6ec23e5a7e.tar.gz
>   spandsp-3.0.0-f995f452ee.tar.gz

upstream updated the tarball three days after the initial release:
https://github.com/signalwire/freeswitch/pull/793#issuecomment-675044027

> Another thing: could you update on release-monitoring.org the definition
> of this project at https://release-monitoring.org/project/12600/ to
> properly track this new upstream location ?

Tried, but failed to find the correct regex.

Regards, Bernd
