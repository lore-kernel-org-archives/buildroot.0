From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 16 Feb 2015 12:00:27 -0500
Subject: [Buildroot] [PATCH 0/3] Minor pkg-rebar updates
Message-ID: <1424106030-16836-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've been trying out the new rebar infrastructure with a few Erlang
packages. Those packages aren't ready to contribute, but I ran into
a few minor issues with the infrastructure that hopefully can make
it into 2015.02.

Frank Hunleth (3):
  pkg-rebar: HOST_CC -> HOSTCC
  pkg-rebar: add bin to list of install directories
  pkg-rebar: fix very minor typos in the comments

 package/pkg-rebar.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

--
1.9.1
