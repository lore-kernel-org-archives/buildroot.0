From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 09:01:17 +0100
Subject: [Buildroot] [PATCH 1/3] package/mutt: fix activation of openssl
 on imap
In-Reply-To: <20201223105950.2278971-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 23 Dec 2020 11:59:48 +0100")
References: <20201223105950.2278971-1-fontaine.fabrice@gmail.com>
Message-ID: <87k0t3d6eq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Activation of openssl for imap is broken since commit
 > 0fcd010a2db771c259224ad1d025fb4c5a9baf3b because of the following typo:
 > BR2_PACKAGET_MUTT_IMAP

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, 2020.08.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
