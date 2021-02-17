From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2021 11:23:57 +0100
Subject: [Buildroot] [PATCH 2/2] package/lcms2: disable tiff
In-Reply-To: <20210215172848.1084947-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 15 Feb 2021 18:28:48 +0100")
References: <20210215172848.1084947-1-fontaine.fabrice@gmail.com>
 <20210215172848.1084947-2-fontaine.fabrice@gmail.com>
Message-ID: <87pn0z3sci.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > tiff is only used by tificc sample and upstream rejected the patch to
 > fix the static build failure because "adding pkg-config dependency for a
 > sample is an overkill": https://github.com/mm2/Little-CMS/pull/244

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
