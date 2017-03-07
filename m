From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Mar 2017 19:30:34 +0100
Subject: [Buildroot] [PATCH] package/dash: fix parallel build
In-Reply-To: <1488908236-25621-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Tue, 7 Mar 2017 18:37:16 +0100")
References: <1488908236-25621-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87pohtaqid.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Fixes:
 >     http://autobuild.buildroot.org/results/14e/14e35f399bb169d00a6e5d76fc981f87980e970d/
 >     http://autobuild.buildroot.org/results/b04/b043f94c445eefd5781e3ddf699e39cf88fcaa08/
 >     http://autobuild.buildroot.org/results/2f8/2f81182eb5733c9f4e23b380df5093978ea465ac/
 >     ...

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 > ---
 > I was unable to reproduce the error after more than 30 builds. It is
 > really a rare occurence, but we have quite a number of similar failures
 > in the autobuilders: http://autobuild.buildroot.org/?reason=dash-0.5.8

Committed, thanks. Don't forget to send the patch upstream.

-- 
Bye, Peter Korsgaard
