From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 04 Sep 2019 21:44:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/dav1d: disable tests and tools
In-Reply-To: <20190904181221.10502-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 4 Sep 2019 20:12:21 +0200")
References: <20190904181221.10502-1-fontaine.fabrice@gmail.com>
Message-ID: <877e6nals6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Some tools need SDL2 which will break the build if SDL2 is found on host
 > Fixes:
 >  - http://autobuild.buildroot.org/results/4cea773805e62911019d0627dcdf5d17b71032b7

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
