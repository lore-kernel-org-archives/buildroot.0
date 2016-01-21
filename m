From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 21 Jan 2016 07:47:27 -0300
Subject: [Buildroot] [PATCH] libv4l: add patch to fix libjpeg build issue
In-Reply-To: <1453369922-12258-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453369922-12258-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <56A0B73F.6020508@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/01/16 06:52, Thomas Petazzoni wrote:

> Since the bump of libjpeg to v9b, libv4l doesn't build anymore due to
> the change of the prototype of jpeg_mem_src(), which gets
> re-implemented in libv4l when the libjpeg is too old.
>
> Fixes:
>
>    http://autobuild.buildroot.org/results/e7a/e7a2341cbbcf514f4cd6754a5a36cebd6556a757/
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

(test via broken jpeg and working jpeg-turbo builds before patching, 
then patching, then both builds work).
