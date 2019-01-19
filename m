From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 19 Jan 2019 16:34:07 +0100
Subject: [Buildroot] [PATCH] package/pango: add upstream security fix
 for CVE-2018-15120
In-Reply-To: <20190118092213.23862-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 18 Jan 2019 10:22:12 +0100")
References: <20190118092213.23862-1-peter@korsgaard.com>
Message-ID: <87lg3g3bm8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > libpango in Pango 1.40.8 through 1.42.3, as used in hexchat and other
 > products, allows remote attackers to cause a denial of service (application
 > crash) or possibly have unspecified other impact via crafted text with
 > invalid Unicode sequences.

 > https://nvd.nist.gov/vuln/detail/CVE-2018-15120

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
