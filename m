From: Michael Rommel <rommel@layer-7.net>
Date: Wed, 11 Sep 2013 20:40:54 +0200
Subject: [Buildroot] adding users in readonly file system
In-Reply-To: <1378879598226-51085.post@n4.nabble.com>
References: <1378879598226-51085.post@n4.nabble.com>
Message-ID: <9A3BD6B3-A4B1-4756-AC47-EC640878FECD@layer-7.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

if you are using buildroot to create the readonly fs, you have two options:

 - either add the user to the appropriate files in the "target" or output/target
subdirectory, where the source files are that are used to create the real
file system image under "images"

- use the menu item "System Configuration" -> "Root filesystem 
overlay directories" to keep your edited files separate, but have them
incorporated into your final image during/after your build.

  Michael.

-- 
Michael Rommel, Erlangen, Germany

On Sep 11, 2013, at 8:06 , sajjadi335 <sajjadi335@yahoo.com> wrote:

> Hi
> 
> I have searched for a while for this, but have not been able to find
> anything. I am not familiar with how linux manages users. So this might be
> something obvious I don't know.
> My problem is I have an embedded system with a readonly root fs, and I want
> to
> - add a user to the system.
> - Change both the root and the user password.
> How could that be done? 
> 
> 
> 
> --
> View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/adding-users-in-readonly-file-system-tp51085.html
> Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130911/c1303bb0/attachment.html>
