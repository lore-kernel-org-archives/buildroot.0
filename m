From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jun 2016 22:20:53 +0200
Subject: [Buildroot] [PATCH 1/6] Replace (e)glibc by glibc
In-Reply-To: <1465422059-22254-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 8 Jun 2016 23:40:54 +0200")
References: <1465422059-22254-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87y45pjc9m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Following the removal of eglibc support, this commit replaces all
 > occurences of "(e)glibc" by just "glibc". Most of the occurences are in
 > package Config.in comments.

 > In addition, when the form "an (e)glibc ..." was used, it is replaced by
 > "a glibc ...".

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed after fixing the issues pointed out by Romain and Yann, thanks.

-- 
Bye, Peter Korsgaard
