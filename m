From: Rod Boyce <buildroot@teamboyce.co.uk>
Date: Fri, 01 Jun 2007 18:49:19 +0100
Subject: [Buildroot] SVN diff was Ogg and Vorbis patch part 2.1
In-Reply-To: <87fy5bj4d7.fsf@sleipner.barco.com>
References: <465AD791.2040108@teamboyce.co.uk>
	<20070529202507.GC30684@aon.at>	<465F19D0.6020001@teamboyce.co.uk>
	<20070531214638.GE12010@aon.at>	<465FF4D1.20709@teamboyce.co.uk>
	<87fy5bj4d7.fsf@sleipner.barco.com>
Message-ID: <46605C1F.5050405@teamboyce.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
> Hi,
>
> RB> If you know a way to get svn diff to work the same way as diff -uN
> RB> does then I am listening.  I have tried passing -N to svn diff but
> RB> without success so that is why I am using just diff.  I have even
> RB> tried 'svn diff --diff-cmd `which diff` -x "-uN --recursive"' but
> RB> it still does not show new files in the diff output.  As for me
> RB> when I just do svn diff I only get changes to files that are on
> RB> SVN I don't get my new changes.
>
> Just svn add them before diffing

Peter,

Thank you for this tip I was looking at svn diff as a waste of space.

Regards,
Rod Boyce
