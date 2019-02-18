From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Feb 2019 23:20:43 +0100
Subject: [Buildroot] [PATCHv2 1/8] support/download/scp: fix download
 with scheme prefix 'scp://'
In-Reply-To: <20190204180553.18394-2-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Mon, 4 Feb 2019 19:05:46 +0100")
References: <20190204180553.18394-1-patrickdepinguin@gmail.com>
 <20190204180553.18394-2-patrickdepinguin@gmail.com>
Message-ID: <87wolwbux0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > The scp download helper is broken when the server URL starts with 'scp://'.
 > Such prefix is used in two situations:
 > 1. to let FOO_SITE point to an scp location without explicitly having to set
 >    'FOO_SITE_METHOD = scp'

 > 2. when BR2_PRIMARY_SITE or BR2_BACKUP_SITE points to an scp location. In
 >    this case, there is no equivalent of 'SITE_METHOD'.

 > Strip out the scheme prefix, similarly to how the 'file' download helper
 > does it. That helper has the same cases as above.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
