From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 18 Jul 2020 08:14:39 +0200
Subject: [Buildroot] local autobuild failures
Message-ID: <CAEyMn7YeeODW9bKxQYY1oXotvyNG+QX41kbGhmrHKiqOsd0hdQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I installed an autobuilder instance locally on our build host. As
Thomas suggested I checked the results before sending the results to
the autobuilder result server.
I faced the following failures that I'm not sure if this depends on
the host configuration/installation or if it is a failure in the
package.

Could someone take a look at that and give me some feedback/hints? The
build runs on a debian 10 installation that normally builds our
buildroot based projects.

uclibc:
https://pastebin.com/D459072K
https://filebin.net/ciweyuk38es1igea

haproxy:
https://pastebin.com/YxSv6FSJ
https://filebin.net/pydnt9vdhfkzn53n


-- 
Heiko
