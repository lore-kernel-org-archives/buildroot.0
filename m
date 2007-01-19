From: Goetz Bock <bock@blacknet.de>
Date: Fri, 19 Jan 2007 14:35:16 +0100
Subject: [Buildroot] chown to root does not work
In-Reply-To: <200701191331.07579.thilo@riessner.de>
References: <200701191331.07579.thilo@riessner.de>
Message-ID: <20070119133516.GI14371@priv.blacknet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Fri, Jan 19 '07 at 13:31, Thilo Riessner wrote:
> In the docs is mentioned, that one doesn't need to be root to build a root 
> filesystem. But when building the filesystem as a normal user, chown is not 
> able to change owner to root in the target filesystem. Is there a solution of 
> the problem, that I don't see?

Use fakeroot. Than the cpio/tar/... root images are owned by root.
-- 
/"\ Goetz Bock at blacknet dot de  --  secure mobile Linux everNETting
\ /       (c) 2006 Creative Commons, Attribution-ShareAlike 2.0 de
 X   [ 1. Use descriptive subjects - 2. Edit a reply for brevity -  ]
/ \  [ 3. Reply to the list - 4. Read the archive *before* you post ]
