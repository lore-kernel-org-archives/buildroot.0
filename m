From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Date: Mon, 8 Jan 2018 10:33:21 +1100
Subject: [Buildroot] patchwork.ozlabs.org down, and e-mails not recorded
In-Reply-To: <20180105214340.6f0cc1f7@windsurf>
References: <20180105214340.6f0cc1f7@windsurf>
Message-ID: <ced2aeb2-82f6-c836-dd5a-e65c6b49c81a@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/01/18 07:43, Thomas Petazzoni wrote:
> Hello,
> 
> Just a quick note to let you know that from here, patchwork.ozlabs.org
> seems to be down at this time (or awfully slow).

bilbo (i.e. ozlabs.org) required a reboot a couple of days ago for a 
kernel upgrade iirc.

ajd at bilbo:~$ uptime
  10:27:36 up 2 days,  1:10,  5 users,  load average: 1.38, 1.96, 1.64

> 
> Also, since a few weeks, we have seen that patchwork misses some
> patches that are sent on the Buildroot mailing list. The mails are sent
> on the mailing list, they are in the mailing list archives, but
> patchwork does not record them.
> 
> An example is:
> 
>    http://lists.busybox.net/pipermail/buildroot/2017-December/209885.html
> 
> PATCH 3/3 was not recorded by patchwork, while other patches in the
> series have been.

Hmm, looking at the patch list, I also see that patch 2/3 in that series 
(https://patchwork.ozlabs.org/patch/852063/) wasn't correctly identified 
in the same series as patch 1 
(https://patchwork.ozlabs.org/patch/852062/) which is a bit weird.

> 
> This again happened today. The first send of:
> 
>    http://lists.busybox.net/pipermail/buildroot/2018-January/210797.html
> 
> only had a few of its patches recorded by patchwork. It was resent a
> few minutes later:
> 
>    http://lists.busybox.net/pipermail/buildroot/2018-January/210858.html
> 
> and then all the patches got recorded.
> 
> This is quite annoying. Is there a way to look in the patchwork logs
> what has happened with those patches ?

I don't have access to the patchwork logs myself - jk, any thoughts?

-- 
Andrew Donnellan              OzLabs, ADL Canberra
andrew.donnellan at au1.ibm.com  IBM Australia Limited
