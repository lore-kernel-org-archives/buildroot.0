From: Pragash Jeyaratnam <pragash.jeyaratnam@gmail.com>
Date: Wed, 18 Mar 2020 10:25:28 -0400
Subject: [Buildroot] Inquiry : Adding a custom python package to buildroot
Message-ID: <CALYA+Yvspb-eeK7KWeAJn2bYtwWq4NK4W6usw6Ts+2OwQ0XLzw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I tried to add a custom python package to buildroot, during build I am
getting following error message.

creating /usr/share/sona
error: could not create '/usr/share/sona': Permission denied
package/pkg-generic.mk:311: recipe for target
'/home/branches/sona/build/dist/build/python-sona-engine-1.0/.stamp_target_installed'
failed
make[1]: ***
[/home/branches/sona/build/dist/build/python-sona-engine-1.0/.stamp_target_installed]
Error 1
Makefile:23: recipe for target '_all' failed
make: *** [_all] Error 2

Would it be possible for anyone to guide me on how to fix the above issue ?

Thank you.

Regards,
Pragash
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200318/2395d8cf/attachment.html>
