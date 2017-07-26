From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Jul 2017 16:53:12 +0200
Subject: [Buildroot] [PATCH] tcpdump: security bump to 4.9.1
In-Reply-To: <20170726094104.GL26551@argentina> (Thomas De Schampheleire's
 message of "Wed, 26 Jul 2017 11:41:04 +0200")
References: <20170726094104.GL26551@argentina>
Message-ID: <87bmo7w8pz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <thomas.de_schampheleire@nokia.com> writes:

 > Fixes CVE-2017-11108/Fix bounds checking for STP
 > Changelog: http://www.tcpdump.org/tcpdump-changes.txt

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > ---

 > Could someone please double-check the hash? I checked the PGP key but do not
 > have the full trust mechanism so cannot be sure that the server public key is
 > valid.

Committed after adding the link to the signature as suggested by Baruch, thanks.

-- 
Bye, Peter Korsgaard
