From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 30 May 2013 21:52:19 +0200
Subject: [Buildroot] [PATCH 5/6] libgtk2: remove useless post-patch hook
In-Reply-To: <1369695664-5670-6-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 28 May 2013 01:01:03 +0200")
References: <1369695664-5670-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1369695664-5670-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87d2s8z1n0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> There used to be a post-patch hook to apply a patch only on the host
 Thomas> variant of libgtk2. However, after the reorganization of the patch
 Thomas> naming policy, this was no longer working properly, so
 Thomas> dd1848bc73ee9dfe211ca3ed3a233707e3bc5955 changed this by a patch that
 Thomas> works on both the target and host variants.

 Thomas> We can therefore get rid of the useless post-patch hook.

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
