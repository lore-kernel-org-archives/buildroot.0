From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Oct 2017 23:51:37 +0200
Subject: [Buildroot] [PATCH] unrar: security bump to version 5.5.8
In-Reply-To: <20170907165838.10399-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 7 Sep 2017 18:58:38 +0200")
References: <20170907165838.10399-1-peter@korsgaard.com>
Message-ID: <87tvyyu5g6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2017-12938 - UnRAR before 5.5.7 allows remote attackers to bypass a
 > directory-traversal protection mechanism via vectors involving a symlink to
 > the . directory, a symlink to the .. directory, and a regular file.

 > CVE-2017-12940 - libunrar.a in UnRAR before 5.5.7 has an out-of-bounds read
 > in the EncodeFileName::Decode call within the Archive::ReadHeader15
 > function.

 > CVE-2017-12941 - libunrar.a in UnRAR before 5.5.7 has an out-of-bounds read
 > in the Unpack::Unpack20 function.

 > CVE-2017-12942 - libunrar.a in UnRAR before 5.5.7 has a buffer overflow in
 > the Unpack::LongLZ function.

 > For more details, see
 > http://www.openwall.com/lists/oss-security/2017/08/14/3

 > While we're at it, add a hash for the license file.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
