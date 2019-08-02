From: Haithem Ben Abdelaziz <haithem.ben.abdelaziz@gmail.com>
Date: Fri, 2 Aug 2019 16:54:55 +0100
Subject: [Buildroot] pb host-pkg-config 0.25
Message-ID: <CAMucF0SAs=GpM1iSdhwxDqi6rjQri2ynPye_hW7SiyrGgnvOYw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le dpkg de host-pkg-config 0.25 g?n?re ces errors: (suite au changement de
versions os linux):


collect2: error: ld returned 1 exit status
Makefile:479: recipe for target 'testglib' failed
make[6]: *** [testglib] Error 1
make[6]: *** Waiting for unfinished jobs....
Makefile:476: recipe for target 'testgdateparser' failed
make[6]: *** [testgdateparser] Error 1

collect2: error: ld returned 1 exit status
Makefile:473: recipe for target 'testgdate' failed
make[6]: *** [testgdate] Error 1
Makefile:554: recipe for target 'all-recursive' failed
make[5]: *** [all-recursive] Error 1
Makefile:389: recipe for target 'all' failed
make[4]: *** [all] Error 2
Makefile:577: recipe for target 'all-recursive' failed
make[3]: *** [all-recursive] Error 1
Makefile:342: recipe for target 'all' failed
make[2]: *** [all] Error 2
package/pkg-generic.mk:158: recipe for target
'/home/g361240/SSD/hd_debug/build/hot/build/host-pkg-config-0.25/.stamp_built'
failed
make[1]: ***
[/home/g361240/SSD/hd_debug/build/hot/build/host-pkg-config-0.25/.stamp_built]
Error 2

How can we resolve that, configuration options .. ?
thank you in advance

ha?them
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190802/3ef3bf8b/attachment.html>
