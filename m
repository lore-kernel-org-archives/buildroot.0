From: Richard Braun <rbraun@sceen.net>
Date: Thu, 3 Jan 2013 17:23:15 +0100
Subject: [Buildroot] Building For 486
In-Reply-To: <000301cde9cd$7b4bb8e0$71e32aa0$@co.uk>
References: <000301cde9cd$7b4bb8e0$71e32aa0$@co.uk>
Message-ID: <20130103162315.GA14023@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 03, 2013 at 04:14:59PM -0000, Ted Wood wrote:
> Even if I set the processor options to 486 using  menuconfig, when I try to
> run it, the built kernel comes up with the message 

Just in case: use make linux-menuconfig and make sure the *kernel*
configuration (in addition to the buildroot configuration) matches the
target hardware.

-- 
Richard Braun
