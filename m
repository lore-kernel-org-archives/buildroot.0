From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Oct 2018 13:57:29 +0200
Subject: [Buildroot] [PATCH 1/3] package/gst-dsp: remove package
In-Reply-To: <1539622004-43558-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Mon, 15 Oct 2018 11:46:42 -0500")
References: <1539622004-43558-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87mur0539y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > The suit of TI OMAP3 dsp tools/libraries are being removed as the
 > upstream projects are no longer active.

 > The gst-dsp package used the tidsp-binaries package.

 > Suggest using Buildroot 2018.02.6 LTS if the feature is still
 > required.

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 > ---

 > This patchset was started after an update was proposed to the TI DSP
 > related packages to fix upstream homepage URLS. It seems the upstream
 > stablized for this DSP feature set primarily for OMAP3 and then the
 > technology has not been moving forward with newer processors.

Committed, thanks.

-- 
Bye, Peter Korsgaard
