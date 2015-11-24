From: Hajime Branko Yamasaki Vukelic <branko@brankovukelic.com>
Date: Tue, 24 Nov 2015 14:43:21 +0100
Subject: [Buildroot] Overriding Buildroot packages
Message-ID: <CAPER3A0P1Qyd_=ktyHt=udawndUfHue8SE_zDQxMHjz+r+pPtg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone!

I've set up my build such that all modification are done in
BR2_EXTERNAL directory, and I have a submodule that points to
unmodified upstream buildroot sources.

I've been trying to find a way to override a package that is normally
provided by Buildroot. By 'override' I mean completely swap it with
another package definition, possibly with different patches, etc.

Right now I've created a package that has a completely different name
(e.g., for package 'foo', I have 'foo-custom'), but this breaks
dependencies for packages that would otherwise depend on the original.

I've dug into pkg-generic.mk and I see that it may not really be
possible, but I wanted to confirm. Can someone tell me if I'm missing
something or this really isn't possible without modifying the
buildroot version of the package?

-- 
Branko
branko at brankovukelic.com

/dev/blog: brankovukelic.com
