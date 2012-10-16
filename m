From: Richard Braun <rbraun@sceen.net>
Date: Tue, 16 Oct 2012 16:23:42 +0200
Subject: [Buildroot] no /dev/console;
 /dev/null when booting with initrd of type 'ext2'
In-Reply-To: <507D6C50.4060607@wanadoo.fr>
References: <507D6C50.4060607@wanadoo.fr>
Message-ID: <20121016142342.GA2131@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 16, 2012 at 04:16:48PM +0200, Thierry Bultel wrote:
> Would the solution be to always have these inodes created in
> 'device_table.txt' ?
> (Works in my case, I do not plan to use the static table)

The devtmpfs "file system" is usually a better approach.

-- 
Richard Braun
