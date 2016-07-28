From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jul 2016 22:03:44 +0200
Subject: [Buildroot] [PATCH 1/1] Fix backward incompatibility on git
	downloader for git older than 1.8.4
In-Reply-To: <1469695222-1749-1-git-send-email-eocanha@igalia.com> ("Enrique
 =?utf-8?Q?Oca=C3=B1a_Gonz=C3=A1lez=22's?= message of "Thu, 28 Jul 2016
 10:40:22 +0200")
References: <1469695222-1749-1-git-send-email-eocanha@igalia.com>
Message-ID: <8760rpv8bj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Enrique" == Enrique Oca?a Gonz?lez <eocanha@igalia.com> writes:

 > The "--no-patch" option used by the git downloader appeared on git
 > 1.8.4. Systems with older git versions show an error and fall back to
 > the wget downloader, which isn't suitable for all the cases.

 > Signed-off-by: Enrique Oca?a Gonz?lez <eocanha@igalia.com>

Committed after rewording the commit message slightly, thanks.

-- 
Bye, Peter Korsgaard
