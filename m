From: Peter Sanford <psanford@nearbuysystems.com>
Date: Fri, 25 Oct 2013 17:19:37 -0700
Subject: [Buildroot] Updating /etc/protocols
In-Reply-To: <526B0698.4010400@zacarias.com.ar>
References: <CANGB_5aEjRq1=5mwPdJ8R9Q20aRdZ2JGpy2giGvz9QhMUoAfdQ@mail.gmail.com>
 <526B0698.4010400@zacarias.com.ar>
Message-ID: <CANGB_5aKYOo2hH+t5yGG5-34-uBNiLHnNHh5Ur_LEAPYEomq-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 25, 2013 at 5:02 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar>wrote:

>
> The updated NetBSD protocols has a lot of comments/emails addresses that
> would take up space [1]. You could just use some linux distribution
> /etc/protocols or trim it down and send a patch.
> For that matter /etc/services could be updated too.


Yeah that was basically why I was asking. I also wanted to verify that
there wasn't any licencing reasons for using a BSD source originally.  If
that's the case I will probably just grab the Debian version[1] which is
quite a bit more concise than the NetBSD one.

[1] -
http://bazaar.launchpad.net/~ubuntu-branches/debian/jessie/netbase/jessie/view/head:/etc-protocols
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131025/b16c3ea1/attachment.html>
