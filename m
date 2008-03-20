From: Nathanael D. Noblet <nathanael@gnat.ca>
Date: Thu, 20 Mar 2008 08:45:41 -0600
Subject: [Buildroot] ncurse address error
In-Reply-To: <00be01c88a77$c9601e00$ad289e86@LPSC0173W>
References: <823018ed0803180357s43bf8890s37521d7606aca432@mail.gmail.com>
	<00be01c88a77$c9601e00$ad289e86@LPSC0173W>
Message-ID: <47E27895.2000909@gnat.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guillaume Dargaud wrote:
> There's an extra 'gnu' being appended in the path:
> 
> wget --passive-ftp  -P /home/guinevere/buildroot/dl 
> "http://ftp.gnu.org/pub/gnu"/gnu/ncurses/ncurses-5.6.tar.gz
> --11:44:49--  http://ftp.gnu.org/pub/gnu/gnu/ncurses/ncurses-5.6.tar.gz
>            => `/home/guinevere/buildroot/dl/ncurses-5.6.tar.gz'
> Resolving ftp.gnu.org... 140.186.70.20
> Connecting to ftp.gnu.org|140.186.70.20|:80... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 11:44:49 ERROR 404: Not Found.

I provided a patch yesterday to fix this, but haven't seen/heard a 
response. Here it is again, since there are a handful of packages 
affected by it.

-- 
Nathanael D. Noblet


-------------- next part --------------
A non-text attachment was scrubbed...
Name: gnu_path.diff
Type: text/x-patch
Size: 9046 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080320/807d3404/attachment-0001.bin 
