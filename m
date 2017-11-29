From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Nov 2017 17:38:35 +0100
Subject: [Buildroot] [PATCH] libevent: disable openssl for host
In-Reply-To: <ee53e592d9f9bab35454d044fdcdae3ac67a9b45.1511882601.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 28 Nov 2017 17:23:21 +0200")
References: <ee53e592d9f9bab35454d044fdcdae3ac67a9b45.1511882601.git.baruch@tkos.co.il>
Message-ID: <87o9nlkpkk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > As host-libevent does not depend on host-openssl, it might attempt to
 > build against the host installed openssl. This does not work very well
 > on various hosts. Since we don't really need encryption support in
 > host-libevent just disable openssl support.

 > Disable build of example code as we already do for the target libevent.

 > Should fix:
 > http://autobuild.buildroot.net/results/403/403886e3afc6d5d18a138f4b0651f3c5a50ed064/
 > http://autobuild.buildroot.net/results/a2a/a2a84692049b0fb8038f1ad4b06554ecdac32e3c/
 > http://autobuild.buildroot.net/results/a36/a36abb1ac556a8b50e140ea1851955744b152608/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
