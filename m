From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 00:33:19 +0200
Subject: [Buildroot] [PATCHv2] package/dbus-cpp: fix cross-compilation
In-Reply-To: <1490132039-29054-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Tue, 21 Mar 2017 22:33:59 +0100")
References: <1490132039-29054-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87zig2z974.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > dbus-cpp has an ugly hack to not cross-build the tools when it detects
 > cross-compilation.

 > However, we already have a host variant that builds those tools (and we
 > anyway don't seem to need them to begin with).

 > Drop our patch that propagates the CXXFLAGS/LDFLAGS_FOR_BUILD. Replace
 > with a patch to cross-compile the tools.

 > Fixes:
 >     http://autobuild.buildroot.org/results/110/1100539caae6ef62c61a3b96bc54f7c0a215cc62/
 >     and many, many more.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 > ---
 > Changes v1 -> v2:
 >   - add missing commit log to patch  (Thomas)

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
