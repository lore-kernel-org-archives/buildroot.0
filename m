From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 15 Mar 2021 21:07:09 +0000
Subject: [Buildroot] [Bug 13616] tar file from git repository generation
 issue
In-Reply-To: <bug-13616-163@https.bugs.busybox.net/>
References: <bug-13616-163@https.bugs.busybox.net/>
Message-ID: <bug-13616-163-QXbhzR03Tr@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13616

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr
           Assignee|unassigned at buildroot.uclibc |yann.morin.1998 at free.fr
                   |.org                        |
             Status|NEW                         |ASSIGNED

--- Comment #3 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Jean-Pierre, All,

Thanks for the report.

The use of --transform (in the current form or similar) has been introduced in
commit 6d938bcb5249 in 2018-04-02, and although we had a few fixups over the
following days, it has stayed like that ever since, until we introduced the
current generic helper, that reuses that exact same --transform pattern.

So, is this a new behaviour on your side, or is it a new package you are
introducing?

In any case, the use of the 'S' flag does indeed make sense.

Can you submit your patches to the mailing list, please?

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
