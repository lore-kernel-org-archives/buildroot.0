From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Oct 2019 00:38:33 +0200
Subject: [Buildroot] [PATCH] package/python-rpi-gpio: add LICENCE.txt
 file and hash codes
In-Reply-To: <20191009171543.8475-1-haylocki@yahoo.co.uk>
References: <20191009171543.8475-1-haylocki@yahoo.co.uk>
Message-ID: <8630467b-d474-e39f-a0e3-c3534bd0af9c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Ian,

 Thanks for this patch.

On 09/10/2019 19:15, haylocki at yahoo.co.uk wrote:
> From: Ian Haylock <haylocki@yahoo.co.uk>

You need to add a Signed-off-by line for yourself.  This is a short way for you
to  assert that you are entitled to contribute the patch under buildroot's
GPL license.  See  http://elinux.org/Developer_Certificate_Of_Origin
for more details.

> ---
>  package/python-rpi-gpio/LICENCE.txt          | 10 ++++++++++
>  package/python-rpi-gpio/python-rpi-gpio.hash |  4 ++++
>  2 files changed, 14 insertions(+)
>  create mode 100644 package/python-rpi-gpio/LICENCE.txt
> 
> diff --git a/package/python-rpi-gpio/LICENCE.txt b/package/python-rpi-gpio/LICENCE.txt
> new file mode 100644
> index 0000000000..f3150cf487
> --- /dev/null
> +++ b/package/python-rpi-gpio/LICENCE.txt

 There is no need to include LICENSE.txt itself - it is included in the tarball
of python-rpi-gpio.

> @@ -0,0 +1,10 @@
> +
> +
> +    Copyright (c) 2012-2014 Ben Croston
> +
> +    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
> +
> +    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
> +
> +    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> +
> diff --git a/package/python-rpi-gpio/python-rpi-gpio.hash b/package/python-rpi-gpio/python-rpi-gpio.hash
> index 03a5344c25..243d222e6b 100644
> --- a/package/python-rpi-gpio/python-rpi-gpio.hash
> +++ b/package/python-rpi-gpio/python-rpi-gpio.hash
> @@ -2,3 +2,7 @@
>  # sha256 from https://pypi.python.org/pypi/rpi_gpio/json
>  md5 777617f9dea9a1680f9af43db0cf150e RPi.GPIO-0.7.0.tar.gz
>  sha256 7424bc6c205466764f30f666c18187a0824077daf20b295c42f08aea2cb87d3f RPi.GPIO-0.7.0.tar.gz
> +# md5, sha256 generated locally
> +md5  9b95630a648966b142f1a0dcea001cb7 LICENCE.txt

 There's no need for the md5, the sha256 is sufficient.

> +sha256 a668b3edecb3e69e81ec25987257008208ffcba9d6c43682033b8060c5f2f994 LICENCE.txt
> +

 Please remove this empty line at the end of the file.

 I could have fixed up all these issues while applying, but the Signed-off-by is
not something I can just change...

 Regards,
 Arnout
