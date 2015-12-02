From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 2 Dec 2015 12:31:34 -0500
Subject: [Buildroot] [psa] various server software upgrades
In-Reply-To: <565EB926.6030809@mail.bg>
References: <20151202073542.GY23754@vapier.lan>
 <565EB926.6030809@mail.bg>
Message-ID: <20151202173134.GB23754@vapier.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02 Dec 2015 11:25, Nikolay Dimitrov wrote:
> On 12/02/2015 09:35 AM, Mike Frysinger wrote:
> > the busybox.net software has been languishing for quite a long time,
> > so i gave it a strong kick today.  just about every piece of software
> > has been upgraded on the box including bugzilla.  my various testing
> > looks like it still works, but if you guys notice anything weird, feel
> > free to let me know.
> > -mike
> 
> I started seeing this warning in the last few days:
> 
> Cloning into 'buildroot'...
> remote: warning: unable to access '/root/.config/git/attributes': 
> Permission denied
> ...

i fixed that once, but my fix was reset.  i've made it work in a diff
way now though so you shouldn't see that again.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151202/90d0632a/attachment.asc>
