From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Nov 2020 10:08:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/guile: disable jit for host and
 target gcc < 5
In-Reply-To: <20201110174114.102917-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 10 Nov 2020 18:41:14 +0100")
References: <20201110174114.102917-1-fontaine.fabrice@gmail.com>
Message-ID: <87tutwmfb0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > jit also raises build failures with host gcc 4.9.2 and x86_64 so disable
 > it if host gcc < 5 and update workaround added by commit
 > d8dad069c861468b17397f01875b95e7375891d7 to apply it for all
 > architectures and not only ARM

 > Fixes:
 >  - http://autobuild.buildroot.org/results/c2c/c2c31ff5c206bd3791d64d953dc1574546644b05

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
