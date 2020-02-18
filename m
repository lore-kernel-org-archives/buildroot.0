From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Feb 2020 03:51:55 +0100
Subject: [Buildroot] [PATCH] package/nodejs: security bump to version
 12.16.0
In-Reply-To: <20200217223849.16987-1-peter@korsgaard.com>
References: <20200217223849.16987-1-peter@korsgaard.com>
Message-ID: <20200218035155.5d9c4d70@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 Feb 2020 23:38:49 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security issues (12.15.0):
> 
> - CVE-2019-15606: HTTP header values do not have trailing OWS trimmed
> 
> - CVE-2019-15605: HTTP request smuggling using malformed Transfer-Encoding
>   header
> 
> - CVE-2019-15604: Remotely trigger an assertion on a TLS server with a
>   malformed certificate string
> 
> For more details, see the advisory:
> https://nodejs.org/en/blog/vulnerability/february-2020-security-releases/
> 
> On top of this, 12.16.0 brings a number of changes and bugfixes.
> 
> Update the license hash for an addition of the (MIT) licensing terms for the
> uvwsai module:
> 
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
> 
> While we are at it, adjust the white space in the .hash function to match
> the new agreements.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/nodejs/nodejs.hash | 6 +++---
>  package/nodejs/nodejs.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
