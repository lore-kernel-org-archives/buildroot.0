From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 21 Jan 2014 21:53:42 +0100
Subject: [Buildroot] [PATCH 1/2] Remove some absolute paths
In-Reply-To: <CAEYzJUHaFZjx++SKC=ER4MxSoZ-0UaPf4Tk1X91GsaNf8kVoqA@mail.gmail.com>
 (=?utf-8?Q?=22Bj=C3=B8rn?= Forsman"'s message of "Tue, 21 Jan 2014 19:14:08
 +0100")
References: <1388421102-29198-1-git-send-email-bjorn.forsman@gmail.com>
 <CAAXf6LU_YFDERq8aEYTfWa-H7ijBV-e9VNCnpnYTa7pAduobfg@mail.gmail.com>
 <87k3dtiv2b.fsf@dell.be.48ers.dk>
 <CAEYzJUHaFZjx++SKC=ER4MxSoZ-0UaPf4Tk1X91GsaNf8kVoqA@mail.gmail.com>
Message-ID: <871u01gip5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bj?rn" == Bj?rn Forsman <bjorn.forsman@gmail.com> writes:

Hi,

 > Oops, this patch wasn't supposted to be commited all by itself and not
 > followed by the "[PATCH 2/2] Prefer
 > 'printf' over 'echo -e' (for portability)" patch. With the current use
 > of "echo -e" there will be breakage if /bin/sh is dash.

 > Peter, could you apply the 2nd patch also and then I can submit a
 > separate patch afterwards to stop the echo/printf mix?

Ok, committed - Thanks.

-- 
Bye, Peter Korsgaard
