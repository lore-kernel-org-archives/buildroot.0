From: Julien Boibessot <julien.boibessot@free.fr>
Date: Mon, 20 Nov 2017 21:40:58 +0100
Subject: [Buildroot] Tkinter
In-Reply-To: <1510827457861-0.post@n4.nabble.com>
References: <1510648594356-0.post@n4.nabble.com>
 <1510827457861-0.post@n4.nabble.com>
Message-ID: <b6c5f85e-19c3-31b6-b09f-f065e52a0ac1@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Kees,

On 16/11/2017 11:17, Kees van Unen wrote:
> Hi guys, 
>
> I wasn't aware that this question is too difficult. Apologies.

If by Tkinter you mean "Tk module for python" then you should first add
Tk package to Buildroot, then Tkinter.

Please find below 2 patches to do that (they didn't find their way to BR
mainline yet):
*
https://sourceforge.net/p/armadeus/code/ci/master/tree/patches/buildroot/2017.02/011-armadeus-add-tk-package.patch
*
https://sourceforge.net/p/armadeus/code/ci/master/tree/patches/buildroot/2017.02/012-armadeus-add-tkinter-support-to-python.patch

Feel free to test them, update them and submit them to Buildroot ;-)

Regards,
Julien
