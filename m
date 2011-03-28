From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Mon, 28 Mar 2011 12:43:18 -0500
Subject: [Buildroot] Add Package: htop
In-Reply-To: <AANLkTi=W-qDJt=dzP_4AJ0cJ+RYfPai00EBDp6=FpU9c@mail.gmail.com>
References: <4D90B11D.4070607@AdTran.com>
	<AANLkTikJvMyKTpn4yZp3JrsvXREU=hM0GxgCuE7heB4i@mail.gmail.com>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1F99AAED@EXV1.corp.adtran.com>
	<AANLkTi=W-qDJt=dzP_4AJ0cJ+RYfPai00EBDp6=FpU9c@mail.gmail.com>
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1F99AAFD@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On Mon, Mar 28, 2011 at 1:21 PM, ANDY KENNEDY wrote:
> > This patch was derived by getting the current branch via svn and
> > running a diff against configure.ac.
> 
> ok, np then.  i might mention in the patch header "this is already
> in
> upstream svn".

Kinda sorta did:

+# This patch removes the hard dependency on backtrace by checking for
+# it at compile time and adds a cross-compile /proc check.
+# Patch given to me by Hisham <hisham.hm@gmail.com> (htop-general)

Hisham is the main developer.  You want me to modify this patch 
again and resubmit?  I don't mind -- and it wouldn't take long.

> -mike

Andy
