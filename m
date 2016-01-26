From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 26 Jan 2016 19:44:53 -0300
Subject: [Buildroot] [PATCH] bind: rename ptrsize to ptr_size in the code
In-Reply-To: <877fiwqafy.fsf@dell.be.48ers.dk>
References: <1453462861-32484-1-git-send-email-gustavo@zacarias.com.ar>
 <877fiwqafy.fsf@dell.be.48ers.dk>
Message-ID: <56A7F6E5.1050002@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/01/16 18:48, Peter Korsgaard wrote:

> What bind version is this patch against? It applies both before and
> after the security bump, both with an offset:
>
> Applying 0003-Rename-ptrsize-to-ptr_size.patch using patch:
> patching file lib/dns/rbt.c
> Hunk #2 succeeded at 480 (offset -37 lines).
> Hunk #3 succeeded at 865 (offset -37 lines).
> patching file lib/dns/rbtdb.c
> Hunk #2 succeeded at 7536 (offset -57 lines).

Hi.
It's against git master.
Regards.
