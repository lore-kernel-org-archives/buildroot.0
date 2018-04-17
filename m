From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 17 Apr 2018 05:56:02 -0300
Subject: [Buildroot] [RFC PATCH 2/3] download/git: recover dirty cache
References: <9a7630cb-2e57-c9a4-1002-92abc47d4472@mind.be>
Message-ID: <5ad5b6a275994_553a2b0a2f22df301567e@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Apr 17, 2018 at 05:10 AM, Arnout Vandecappelle wrote:

> On 17-04-18 09:04, Ricardo Martincoski wrote:

Thank you for your comments.

>> Here is a squashed, no commit log, no comments on the code, hackish preview:
>> https://gitlab.com/RicardoMartincoski/buildroot/commit/f4e20bb62b761bb6c82a29acbd2f8d56d90e4e9c
> 
>  Looks good to me, with the following mods:
> 
> * use GIT_DIR
> * add comment above git init explaining that it is safe

> * explain why -ff is needed for git clean
> * Removing the shallow fetch should be done in a separate patch (I'm not
> entirely convinced yet that it is needed).

These 2 are already covered by Yann's WIP series, with comments and proper
commit logs:
https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/git-robust

Regards,
Ricardo
