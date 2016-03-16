From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Mar 2016 23:45:15 +0100
Subject: [Buildroot] [PATCH 4/4] lxc: remove dependency on headers >= 3.0
In-Reply-To: <20160316233611.6c664973@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 16 Mar 2016 23:36:11 +0100")
References: <1458159611-5613-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458159611-5613-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <87twk66onk.fsf@dell.be.48ers.dk>
 <20160316233611.6c664973@free-electrons.com>
Message-ID: <87lh5i6o04.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

>> The setns() system call first appeared in Linux in kernel 3.0;
 >> library support was added to glibc in version 2.14.
 >> 
 >> So I think it is safer to just keep the >= 3.0 headers dependency.

 > But I agree with you, it's probably better to keep the >= 3.0 headers
 > dependency. However, the comment that the dependency comes from libcap
 > should be changed.

 > Should I change a patch to fix this?

Yes please!

-- 
Venlig hilsen,
Peter Korsgaard 
