From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Feb 2015 08:49:49 +0100
Subject: [Buildroot] [PATCH v1 1/1] qt5webkit: Fix build without OpenGl
In-Reply-To: <CAKHhJn2f2QjCRUBunpw_CkmruBuxNxCvCjH3_wUxGgrMPWuXNA@mail.gmail.com>
 (Johan Derycke's message of "Thu, 5 Feb 2015 08:38:35 +0100")
References: <1423079762-1517-1-git-send-email-johanderycke@gmail.com>
 <CAKHhJn2f2QjCRUBunpw_CkmruBuxNxCvCjH3_wUxGgrMPWuXNA@mail.gmail.com>
Message-ID: <87lhkcajc2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Johan" == Johan Derycke <johanderycke@gmail.com> writes:

 > Forgot to mention the source of this patch:
 > https://qt.gitorious.org/qt/qtwebkit/commit/4ecb913768ff0806c6efd

That would indeed have been good to mention. Committed with that added
to the commit message and the fact that it fixes a number of autobuilder
issues:

http://autobuild.buildroot.net/?reason=qt5webkit-5.4.0

Thanks!

-- 
Bye, Peter Korsgaard
