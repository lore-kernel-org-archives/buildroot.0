From: Michael Rommel <rommel@layer-7.net>
Date: Sat, 14 Sep 2013 14:36:26 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-09-13
In-Reply-To: <20130914063005.CC66352C101@lolut.humanoidz.org>
References: <20130914063005.CC66352C101@lolut.humanoidz.org>
Message-ID: <16A28366-18D6-4148-B7E5-1FB4C61CB473@layer-7.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I thought I take care of one of the build failures from yesterday and picked the line:

      arm |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/e93e24d210dc7a2a51758536b7b3964b8a3251b4/

I tried to reproduce the error, but was unable to do so in three attempts.
 1. used a clean i568 toolchain without configuration and gave only a make toolchain libssh2
 2. used a clean arm toolchain with a default .config file and made a make toolchain libssh2
 3. used the config file from the autobuilder and did a make toolchain libssh2

Always used the toolchain from buildroot itself.

All three commands completed successfully and libssh2 found the libssl without any problems.

Although I'd like to help, I am now stuck - without reproducing the error, I have no idea, how to fix it.

BR,

  Michael.

-- 
Michael Rommel, Erlangen, Germany

On Sep 14, 2013, at 8:30 , Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Build statistics for 2013-09-13
> ===============================
> 
>        success : 52 
>       failures : 56 
>       timeouts : 0  
>          TOTAL : 108
> 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130914/39baff0f/attachment.html>
