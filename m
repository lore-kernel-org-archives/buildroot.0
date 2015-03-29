From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 14:46:07 +0200
Subject: [Buildroot] [PATCH] python modules search in non english locale
 (zlib, ...)
In-Reply-To: <5515E2AC.3010100@armadeus.com>
References: <5515E2AC.3010100@armadeus.com>
Message-ID: <20150329144607.0e60928f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear S?bastien Royen,

On Sat, 28 Mar 2015 00:07:24 +0100, S?bastien Royen wrote:
> setup.py: do not add crosscompile header locations if language is not
> english
> 
> With buildroot toolchain, gcc can be multi language.
> Python package setup.py need gcc english output to work fine. (find zlib
> for example)
> We force language to en_US for the need of output parsing.
> 
> Signed-off-by: Sebastien Royen <sebastien.royen@armadeus.com>

What you posted is not a Buildroot patch, so we cannot apply it. I
guess it's a python or python3 patch. Can you rework this to make it
actually usable by Buildroot, and also make sure whether the issue is
applicable to python, python3, or both?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
