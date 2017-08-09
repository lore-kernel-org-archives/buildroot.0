From: grunpferd at netscape.net <grunpferd@netscape.net>
Date: Tue, 8 Aug 2017 20:23:02 -0400
Subject: [Buildroot] Failing gst1-validate-1.12.2 build,
	documentation not necessary!
Message-ID: <15dc45f8e06-3056-94cf@webprd-m104.mail.aol.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



In building gst1-validate-1.12.2. 


I think building "all" here is not necessary. Can't see the documentation is ever going to be installed on a target.
So why build it at all, especially when it fails!






make[4]: Leaving directory '/u/rfg/w/buildroot_tk1_gcc7_4.12/output/build/gst1-validate-1.12.2/docs/validate'

sphinx-build -b html -d ./doctrees   . ./html
Error: Source directory doesn't contain a conf.py file.
Makefile:687: recipe for target 'all' failed
make[4]: *** [all] Error 1
make[4]: Leaving directory '/u/rfg/w/buildroot_tk1_gcc7_4.12/output/build/gst1-validate-1.12.2/docs/launcher'
Makefile:806: recipe for target 'launcher' failed
make[3]: *** [launcher] Error 2
make[3]: Leaving directory '/u/rfg/w/buildroot_tk1_gcc7_4.12/output/build/gst1-validate-1.12.2/docs'
Makefile:713: recipe for target 'all-recursive' failed
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory '/u/rfg/w/buildroot_tk1_gcc7_4.12/output/build/gst1-validate-1.12.2'
Makefile:623: recipe for target 'all' failed
make[1]: *** [all] Error 2
make[1]: Leaving directory '/u/rfg/w/buildroot_tk1_gcc7_4.12/output/build/gst1-validate-1.12.2'
package/pkg-generic.mk:227: recipe for target '/u/rfg/w/buildroot_tk1_gcc7_4.12/output/build/gst1-validate-1.12.2/.stamp_built' fail
ed
make: *** [/u/rfg/w/buildroot_tk1_gcc7_4.12/output/build/gst1-validate-1.12.2/.stamp_built] Error 2




Ross

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170808/898e173c/attachment.html>
