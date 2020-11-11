From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Nov 2020 11:47:29 +0100
Subject: [Buildroot] [PATCH 2/2] package/slirp: add libglib2 mandatory
 dependency
In-Reply-To: <20201111101152.2088027-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 11 Nov 2020 11:11:52 +0100")
References: <20201111101152.2088027-1-fontaine.fabrice@gmail.com>
 <20201111101152.2088027-2-fontaine.fabrice@gmail.com>
Message-ID: <871rh0mapq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > slirp depends on libglib2, don't update xen as it already depends on it
 > Fixes:
 >  - http://autobuild.buildroot.org/results/0b9cff1bc650876a6fff6102b2cb31dcdf4c5e8f

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
