From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 26 Apr 2017 06:49:35 +0000
Subject: [Buildroot] [PATCH] uclibc: update to 1.0.24
In-Reply-To: <20170422225732.GA21566@waldemar-brodkorb.de>
References: <20170422225732.GA21566@waldemar-brodkorb.de>
Message-ID: <1493189374.3442.2.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

On Sun, 2017-04-23 at 00:57 +0200, Waldemar Brodkorb wrote:
> Fixes aarch64 C++ issue. Removes old implementations for fnmatch/regex.

This also fixes uClibc building for ARC with arc-2017.03 tools,
this is captured in this autobuilder instance:
-------------------------->8------------------------
http://autobuild.buildroot.net/results/f92/f92b5cdae0a389d911a12d309edc2871f84f994b/build-end.log
-------------------------->8------------------------

The fix is?https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=a3805b91ecdb458cd20245c20e49deacc58e9c32

-Alexey
