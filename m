From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Oct 2015 18:27:34 +0200
Subject: [Buildroot] [PATCH 2/2] mpdecimal: fix comment about fenv.h
In-Reply-To: <1443969386-22868-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 4 Oct 2015 15:36:26 +0100")
References: <1443969386-22868-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1443969386-22868-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87eghamweh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > We're disabling fenv.h usage on i386 because it is not available in
 > musl/uclibc (and not musl/glibc as was written).

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
