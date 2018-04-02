From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Apr 2018 16:11:29 +0200
Subject: [Buildroot] [PATCH] core/pkg-download: fixes autobuilder fallout
In-Reply-To: <20180402133353.24586-1-maxime.hadjinlian@gmail.com> (Maxime
 Hadjinlian's message of "Mon, 2 Apr 2018 15:33:53 +0200")
References: <20180402133353.24586-1-maxime.hadjinlian@gmail.com>
Message-ID: <87efjxn1f2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > Some arguments can be empty, so we need to add simple quote around them
 > But since they are simple quote; double quote inside them are now not
 > interpreted by the shell and as such must be removed; hence the use of
 > qstrip.

 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Committed after fixing s/simple/single/, thanks.

-- 
Bye, Peter Korsgaard
