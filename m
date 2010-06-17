From: Julien Boibessot <julien.boibessot@free.fr>
Date: Thu, 17 Jun 2010 15:12:02 +0200
Subject: [Buildroot] package/games/Config.in usage
Message-ID: <4C1A1F22.70500@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

it seems package/games/Config.in is not used. Indeed package/Config.in
do not "source" it but copy its content (line 76).

What is the actual philosophy in BR: regroup packages by "classes" (ex
games, multimedia...) in package/ subdirs and then source these
sub-Config.in in package/Config.in or put all packages in package/ and
organize the stuff in package/Config.in ?
(I prefer the second one)

Regards,
Julien
