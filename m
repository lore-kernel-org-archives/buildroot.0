From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 10:06:39 +0100
Subject: [Buildroot] [PATCH] swupdate: Fix SHA256 hash verification
In-Reply-To: <1509436264-17646-1-git-send-email-msalau@iotecha.com> (Maksim
 Salau's message of "Tue, 31 Oct 2017 10:51:04 +0300")
References: <1509436264-17646-1-git-send-email-msalau@iotecha.com>
Message-ID: <87h8thjtnk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maksim" == Maksim Salau <msalau@iotecha.com> writes:

 > swupdate 2017.07 has a bug which makes hash verification faulty.
 > The commit adds a patch to fix the issue. The fix has already been
 > pushed to upstream and is a copy of the commit
 > dba95dcd3739c604a81ffa2df2545e7a4cd430cf in the swupdate repo [1].

 > [1] https://github.com/sbabic/swupdate

 > Signed-off-by: Maksim Salau <msalau@iotecha.com>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
