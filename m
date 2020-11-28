From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Nov 2020 08:52:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-xserver:
 drop obsolete patch
In-Reply-To: <20201126190842.29171-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 26 Nov 2020 20:08:42 +0100")
References: <20201126190842.29171-1-fontaine.fabrice@gmail.com>
Message-ID: <87tut9rk9o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Drop second patch following upstream review:
 > https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/555

 > Indeed, this patch has been dropped from openembedded since 2018 because
 > "it is forcing input to use SIGIO, despite the fact that since 2015
 > xserver has used an input thread.":
 > https://github.com/openembedded/openembedded-core/commit/cde11398e6d74ad8f27334199b4bd99cdf1f0ff7

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
