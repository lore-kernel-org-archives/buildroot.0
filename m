From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Dec 2014 11:17:26 +0100
Subject: [Buildroot] [PATCH v5 1/4] Rename the variable "QUIET" to
 "BR_QUIET" for conformance
In-Reply-To: <1419324901-14003-2-git-send-email-fabio.porcedda@gmail.com>
References: <1419324901-14003-1-git-send-email-fabio.porcedda@gmail.com>
 <1419324901-14003-2-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20141223111726.617588fd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Dec 2014 09:54:58 +0100, Fabio Porcedda wrote:
> Rename the variable "QUIET" to "BR_QUIET" accordingly to the convention
> that internal variables should be named BR_XXX.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Do we really want all internal variables to be named BR_* ? Like
HOST_CONFIGURE_OPTS, TARGET_CONFIGURE_OPTS, TARGET_MAKE_ENV and al. ?
I'm not sure we want to do this, do we?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
