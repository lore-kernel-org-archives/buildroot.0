From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Dec 2016 21:02:02 +0100
Subject: [Buildroot] [PATCH 11/11] runc: pass -extldflags '-static' in
	good variable
In-Reply-To: <1482346246-87491-1-git-send-email-fabrice.fontaine@orange.com>
 (Fabrice Fontaine's message of "Wed, 21 Dec 2016 19:50:46 +0100")
References: <1482346246-87491-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <87r3512gqt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

Patch 11/11?

 > The modification made in http://patchwork.ozlabs.org/patch/652102
 > contained a small copy/paste error, FLANNEL_GLDFLAGS was used instead of
 > RUNC_GLDFLAGS.

 > Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>

Committed, thanks after rewording the commit message to refer to the
exact commit.

-- 
Bye, Peter Korsgaard
