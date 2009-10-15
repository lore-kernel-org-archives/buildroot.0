From: Vellemans, Noel <Noel.Vellemans@visionBMS.com>
Date: Thu, 15 Oct 2009 18:25:35 +0200
Subject: [Buildroot] M4 version check fails.
Message-ID: <1531E53627F1F749B4FE809BF2A4EB670139DADC@WETMEX10.loepfe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,


Just encountered a problem into the git-buildroot. (after a new-build)

The build stops with the error "GNU M4 1.4.6 or later is required;
1.4.13 is recommended"

The version I have installed is 1.4.11. .. this should be ok (according
what is being displayed into the error)
And the version build into the buildroot is 1.4.9 (if i'm not wrong).



Regards Noel


<< LOG - snip  >>

configure: WARNING: unrecognized options: --disable-static checking for
a BSD-compatible install... /usr/bin/install -c checking whether build
environment is sane... yes checking for a thread-safe mkdir -p...
/bin/mkdir -p checking for gawk... gawk checking whether make sets
$(MAKE)... yes checking whether /bin/sh -n is known to work... no
checking for characters that cannot appear in file names... none
checking whether directories can have trailing spaces... yes checking
for expr... /usr/bin/expr checking for GNU M4 that supports accurate
traces... configure: error: no acceptable m4 could be found in $PATH.
GNU M4 1.4.6 or later is required; 1.4.13 is recommended
make: ***
[/buildhome/20091014/buildroot/output/stamps/host_autoconf_configured]
Error 1



<< END - LOG >>
