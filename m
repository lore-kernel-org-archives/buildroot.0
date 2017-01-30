From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Jan 2017 16:19:46 +0100
Subject: [Buildroot] [PATCH v2,1/1] lxc: install also in staging
In-Reply-To: <1482070433-17578-1-git-send-email-fabrice.fontaine@orange.com>
 (Fabrice Fontaine's message of "Sun, 18 Dec 2016 15:13:53 +0100")
References: <1482070433-17578-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <8760kw8til.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Install also lxc in staging directory, this will be needed for the
 > incoming integration of lxd package. Moreover, other packages could
 > find useful to integrate with liblxc instead of using lxc-xxx binaries.

 > Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
 > ---
 > Changes v1 -> v2 (after review of Thomas Petazzoni):
 >  - Update commit message

Committed, thanks.

-- 
Bye, Peter Korsgaard
