From: =?UTF-8?B?SsOpcsO0bWUgQkFSRE9O?= <bardon.pro@gmail.com>
Date: Thu, 5 Jan 2017 16:32:15 +0100
Subject: [Buildroot]  Relocatable staging dir and reference to build dir
Message-ID: <CAFKqv7y-ARxUBgiubYHK_fUwtHz1L=zgXBHpMnSBAD2FDBXfOw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

Our need is to relocate the staging dir for developers (and automatic
bulld by Jenkins).
We found that there are absolute paths in the staging tree config
files for libs and also references to the bulld dir.
Is there a way to have relative paths in .la and pkgconfig files? Or
another mean to change absolute paths?


J?r?me Bardon
Aviwest
