From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Mar 2020 17:20:32 +0100
Subject: [Buildroot] [git commit] package/nodejs: security bump to
 version 12.16.0
In-Reply-To: <20200218024001.BC3F38E3F3@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Tue, 18 Feb 2020 03:51:37 +0100")
References: <20200218024001.BC3F38E3F3@busybox.osuosl.org>
Message-ID: <875zf8z0of.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=61810db5187e6fad32e08214ec12b43a1c5f9b5a
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fixes the following security issues (12.15.0):

 > - CVE-2019-15606: HTTP header values do not have trailing OWS trimmed

 > - CVE-2019-15605: HTTP request smuggling using malformed Transfer-Encoding
 >   header

 > - CVE-2019-15604: Remotely trigger an assertion on a TLS server with a
 >   malformed certificate string

 > For more details, see the advisory:
 > https://nodejs.org/en/blog/vulnerability/february-2020-security-releases/

 > On top of this, 12.16.0 brings a number of changes and bugfixes.

 > Update the license hash for an addition of the (MIT) licensing terms for the
 > uvwsai module:

 > +
 > +- uvwasi, located at deps/uvwasi, is licensed as follows:
 > +  """
 > +    MIT License
 > +
 > +    Copyright (c) 2019 Colin Ihrig and Contributors
 > +
 > +    Permission is hereby granted, free of charge, to any person obtaining a copy
 > +    of this software and associated documentation files (the "Software"), to deal
 > +    in the Software without restriction, including without limitation the rights
 > +    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 > +    copies of the Software, and to permit persons to whom the Software is
 > +    furnished to do so, subject to the following conditions:
 > +
 > +    The above copyright notice and this permission notice shall be included in all
 > +    copies or substantial portions of the Software.
 > +
 > +    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 > +    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 > +    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 > +    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 > +    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 > +    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 > +    SOFTWARE.
 > +  """

 > While we are at it, adjust the white space in the .hash function to match
 > the new agreements.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.11.x, thanks.

2019.02.x is using nodejs 8.x which is now EOL. Given how close we are
to EOL'ing 2019.02.x I have so far NOT bumped to the 12.x version.

-- 
Bye, Peter Korsgaard
