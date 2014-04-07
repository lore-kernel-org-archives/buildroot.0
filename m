From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 07 Apr 2014 10:36:43 -0300
Subject: [Buildroot] [PATCH] eglibc: bump to version 2.19 SVN R25243
In-Reply-To: <20140407152919.2d1147fb@skate>
References: <1396875879-22199-1-git-send-email-gustavo@zacarias.com.ar>
 <20140407152919.2d1147fb@skate>
Message-ID: <5342A9EB.1030801@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/07/2014 10:29 AM, Thomas Petazzoni wrote:

> So we don't do like glibc where we support both 2.18 and 2.19 ? This is
> really a question, maybe it makes sense to only support one version at
> a time. In which case we could remove 2.18 from glibc.

My opinion is that we should just keep it as simple as possible.
If there's a special need for some architecture (like microblaze) let it
be so, but really unless we know there's some issue or exception i don't
think there's much value in keeping multiple versions, specially since
*glibc is backwards ABI compatible.
Regards.
