From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 May 2015 08:43:45 +0200
Subject: [Buildroot] [PATCH v2 1/1] wvstreams: not available for static
	only builds
In-Reply-To: <1431930472-1423-1-git-send-email-imrehg@gmail.com> (Gergely
 Imreh's message of "Mon, 18 May 2015 06:27:54 +0000")
References: <1431930472-1423-1-git-send-email-imrehg@gmail.com>
Message-ID: <87bnhi75cu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gergely" == Gergely Imreh <imrehg@gmail.com> writes:

 > Also propagated to wvdial as it selects wvstreams.
 > Fixes:
 >  http://autobuild.buildroot.org/results/0cd/0cd5e0263b42e6845504d97688632e16206bd000/
 >  http://autobuild.buildroot.org/results/4e0/4e0ab461ea7ed7a288303741eec89156abd49864/

 > Signed-off-by: Gergely Imreh <imrehg@gmail.com>
 > ---
 > Changes v1 -> v2:
 >  Add dependency changes to wvdial as well (thanks Baruch Siach)

Committed, thanks.

-- 
Bye, Peter Korsgaard
