From: =?UTF-8?Q?J=C3=A9r=C3=B4me_Pouiller?= <jezz@sysmic.org>
Date: Fri, 06 Sep 2013 10:57:43 +0200
Subject: [Buildroot] [RFCv1 00/11] Convert toolchain backends to
 packages to fix source/external-deps/legal-info
In-Reply-To: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <a732406fe5a58630caddfdf3453ff06e@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2013-09-05 23:27, Thomas Petazzoni wrote:
> Hello,
>
> The final goal of this patch set is to get 'make source' and 'make
> external-deps' to behave properly after the conversion of the 
> internal
> toolchain backend to the package infrastructure.

Great!

> To do so, the idea of this patch is to:
>
>  (1) Create a 'toolchain' virtual package, which will depend on the
>      particular toolchain backend depending on the configuration.
Is it too early to move toolchain/ to package/? Or there is a reason
to keep toolchain/ out of package/?


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
