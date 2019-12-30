From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 30 Dec 2019 22:05:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: Replace libtirpc
 patch with simple removing files
In-Reply-To: <20191230205218.GV26395@scaer>
References: <20191230202750.12541-1-petr.vorel@gmail.com>
 <20191230205218.GV26395@scaer>
Message-ID: <20191230210509.GA19473@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

> On 2019-12-30 21:27 +0100, Petr Vorel spake thusly:
> > We delete files anyway, so let's use this way instead of applying patch.

> No, we prefer patches over hooks, and we've in the past replaced hooks
> that tweak/remove files with patches with the same effect.
Thanks for review and explain the policy.

> Besides, I'm pretty sure your patch is wrong, see below...
You right, I'm sorry to sent wrong patch.
I usually run validate patch, this time I didn't check. I'll be careful next
time.

> > Since libtirpc update to 1.2.5 commit message in patch was wrong anyway
> > (libtirpc patch 0005-Disable-DES-authentification-support.patch was
> > replaced by upstream solution).

> Then it is better to fix the description of the patch.
Sure. I'll wait whether upstream patch is accepted (if yes, I'll replace patch,
otherwise I fix the description).

Kind regards,
Petr
