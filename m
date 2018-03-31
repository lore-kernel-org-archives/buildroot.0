From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 15:06:05 +0200
Subject: [Buildroot] [PATCH RESEND 2/2] fs/squashfs: enable squashfs to
 generate a verity hashtable
In-Reply-To: <1521829279-5156-3-git-send-email-ben.whitten@gmail.com> (Ben
 Whitten's message of "Fri, 23 Mar 2018 18:21:19 +0000")
References: <1521829279-5156-1-git-send-email-ben.whitten@gmail.com>
 <1521829279-5156-3-git-send-email-ben.whitten@gmail.com>
Message-ID: <87in9cv1he.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ben" == Ben Whitten <ben.whitten@gmail.com> writes:

 > For those times that you want to verify that your readonly filesystem
 > hasn't been tampered we can generate a dm-verity hash table.
 > The root hash is enclosed in .table file and must be secured else where.

 > Signed-off-by: Ben Whitten <ben.whitten@gmail.com>

Like we discussed earlier, this is too simplistic/specific, and should
be handled in a post-image script.

I've marked this patch as rejected in patchwork.

-- 
Bye, Peter Korsgaard
