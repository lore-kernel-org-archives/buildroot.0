From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Jan 2019 22:10:51 +0100
Subject: [Buildroot] [PATCH 03/10] package/vboot-utils: Add support for
 openssl 1.1.x
In-Reply-To: <20190125160420.10932-3-patrick.havelange@essensium.com> (Patrick
 Havelange's message of "Fri, 25 Jan 2019 17:04:13 +0100")
References: <20190125160420.10932-1-patrick.havelange@essensium.com>
 <20190125160420.10932-3-patrick.havelange@essensium.com>
Message-ID: <87a7jlolgk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Patrick" == Patrick Havelange <patrick.havelange@essensium.com> writes:

 > From: Vadim Kochan <vadim4j@gmail.com>
 > Backported changes from commit bce7904376beee2912932433a4634c1c25afe2f5,
 > there was some conflicts in few places which includes openssl_compat.h and
 > 1 place in vb2_rsa_sig_alg function.

 > Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
 > Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>

 > ---
 > Changes v6:
 >   - Added original commit hash in patch

Committed, thanks.

-- 
Bye, Peter Korsgaard
