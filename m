From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 5 Sep 2013 10:04:46 +0200
Subject: [Buildroot] More patches to apply
Message-ID: <CAAXf6LXw9gPrdwG+g81XH15V3MXe4HBj5timyVQPPS3k2p43ow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

I think following patches can be applied now:

http://patchwork.ozlabs.org/patch/272175/
(build reprod. in make 3.82: I think there is consensus on the part
the patch addresses; how we will continue to check for missing
dependencies is not yet clear but this does not block the patch from
being applied)

http://patchwork.ozlabs.org/patch/264231/
http://patchwork.ozlabs.org/patch/264232/
suitable-extractor + host-xzcat

http://patchwork.ozlabs.org/patch/243427/
plain URL in FOO_PATCH

http://patchwork.ozlabs.org/patch/272711/
flex and bison dependencies in perf


Following patches in patchwork are superseded:
http://patchwork.ozlabs.org/patch/271170/
http://patchwork.ozlabs.org/patch/272589/


Thanks,
Thomas
