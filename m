From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 22:32:57 +0100
Subject: [Buildroot] [PATCH] ruby: security bump to version 2.4.2
In-Reply-To: <20171112134311.8475-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 12 Nov 2017 14:43:11 +0100")
References: <20171112134311.8475-1-peter@korsgaard.com>
Message-ID: <87a7z8enee.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixed the following security issues:
 > CVE-2017-0898: Buffer underrun vulnerability in Kernel.sprintf
 > CVE-2017-10784: Escape sequence injection vulnerability in the Basic
 > authentication of WEBrick
 > CVE-2017-14033: Buffer underrun vulnerability in OpenSSL ASN1 decode
 > CVE-2017-14064: Heap exposure in generating JSON

 > For more details, see the release notes:
 > https://www.ruby-lang.org/en/news/2017/09/14/ruby-2-4-2-released/

 > Drop now upstreamed rubygems patches and add hashes for the license files
 > while we're at it.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x and 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
