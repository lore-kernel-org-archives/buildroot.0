From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 28 Jan 2010 13:47:20 -0300
Subject: [Buildroot] cortex-m3 support ?
In-Reply-To: <87wrz2mbec.fsf@macbook.be.48ers.dk>
References: <ec1f3d401001272243l12a18ad9iee47ff04f7c366ea@mail.gmail.com>
	<87wrz2mbec.fsf@macbook.be.48ers.dk>
Message-ID: <4B61BF98.5010903@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/28/2010 01:39 PM, Peter Korsgaard wrote:

> Isn't cortex-m3 for deeply embedded stuff? There's afaik no Linux or
> uClibc support, so that's pretty much a showstopper.

There's some preliminary/experimental uClinux support for M3 in thumb2
mode, but it requires some patching around and is nommu.
Regrads.
