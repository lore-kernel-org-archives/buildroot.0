From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Nov 2019 09:13:13 +0100
Subject: [Buildroot] [PATCH-2019.02.x] package/python3: security bump to
 version 3.7.5
In-Reply-To: <20191101134023.27832-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 1 Nov 2019 14:40:22 +0100")
References: <20191101134023.27832-1-peter@korsgaard.com>
Message-ID: <87a79dgyxy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerabilities:
 > - bpo-38243: Escape the server title of xmlrpc.server.DocXMLRPCServer when
 >   rendering the document page as HTML.  (Contributed by Dong-hee Na in
 >   bpo-38243.)

 > - bpo-38174: Update vendorized expat library version to 2.2.8, which
 >   resolves CVE-2019-15903.

 > - bpo-37764: Fixes email._header_value_parser.get_unstructured going into an
 >   infinite loop for a specific case in which the email header does not have
 >   trailing whitespace, and the case in which it contains an invalid encoded
 >   word.  Patch by Ashwin Ramaswami.

 > - bpo-37461: Fix an infinite loop when parsing specially crafted email
 >   headers.  Patch by Abhilash Raj.

 > - bpo-34155: Fix parsing of invalid email addresses with more than one @
 >   (e.g.  a at b@c.com.) to not return the part before 2nd @ as valid email
 >   address.  Patch by maxking & jpic.

 > Additionally, the release contains a number of non-security related fixes.
 > For details, see the changelog:

 > https://docs.python.org/3.7/whatsnew/changelog.html#python-3-7-5-final

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
