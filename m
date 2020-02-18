From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Feb 2020 23:06:29 +0100
Subject: [Buildroot] [PATCHv2] package/libxml2: add upstream security
 fix for CVE-2019-20388
In-Reply-To: <20200218093136.15834-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Tue, 18 Feb 2020 10:31:34 +0100")
References: <20200218093136.15834-1-patrickdepinguin@gmail.com>
Message-ID: <87y2szeeje.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > Fixes CVE-2019-20388: xmlSchemaPreRun in xmlschemas.c in libxml2 2.9.10
 > allows an xmlSchemaValidateStream memory leak.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > ---
 > v2: add sob line inside patch (ThomasP)

It would be great if we could start updating <pkg>_IGNORE_CVES for such
patches as well, thanks.

-- 
Bye, Peter Korsgaard
