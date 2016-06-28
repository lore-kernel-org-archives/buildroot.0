From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jun 2016 22:25:18 +0200
Subject: [Buildroot] [PATCH 2/6] docs/manual: don't mention eglibc,
	mention musl
In-Reply-To: <1465422059-22254-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 8 Jun 2016 23:40:55 +0200")
References: <1465422059-22254-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1465422059-22254-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87twgdjc29.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Following the removal of eglibc, it no longer makes sense to talk about
 > it in the Buildroot manual as one of the supported C libraries. However,
 > it does make sense to indicate that we support musl.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed after removing the extra 'the' as noticed by Yann, thanks.

We also still need to do a s/uClibc/uClibc-ng/ all over the manual.

-- 
Bye, Peter Korsgaard
