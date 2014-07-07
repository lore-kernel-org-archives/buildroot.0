From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 07 Jul 2014 14:51:40 -0300
Subject: [Buildroot] [PATCH] lxc: disable lua and python
In-Reply-To: <87tx6t12oz.fsf@dell.be.48ers.dk>
References: <1404603241-20187-1-git-send-email-gustavo@zacarias.com.ar>	<87oax22rks.fsf@dell.be.48ers.dk>
 <53B9DBC7.10407@zacarias.com.ar> <87tx6t12oz.fsf@dell.be.48ers.dk>
Message-ID: <53BADE2C.7080804@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/07/2014 02:47 PM, Peter Korsgaard wrote:
> Ok, thanks. It would be good to have that kind of info in the commit
> message.

There are other packages that do the same as well for the same reason,
what would be interesting to know is how to handle it in general
(examples: alsa-lib, avahi, libxml2, libxslt, cups, newt and a few more).
One notable split package for this is thrift but it's a special case in
that it bundles python-thrift but is really a separate package upstream.
Regards.
