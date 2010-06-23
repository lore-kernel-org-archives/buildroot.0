From: Cristi Magherusan <Cristi.Magherusan@net.utcluj.ro>
Date: Wed, 23 Jun 2010 21:06:20 +0300
Subject: [Buildroot] package/customize
In-Reply-To: <0D753D10438DA54287A00B027084269763716C4C12@AUSP01VMBX24.collaborationhost.net>
References: <0D753D10438DA54287A00B027084269763716C4C12@AUSP01VMBX24.collaborationhost.net>
Message-ID: <1277316380.24680.10.camel@ufo>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2010-06-23 at 12:03 -0500, H Hartley Sweeten wrote:
> Hello all,
> 
> Is there a way to tag the package/customize directory so that a 
> 'git pull' will ignore it?  I use that directory as a hacking point
> to test/add packages that are not currently in buildroot.  Right
> now, every time I do a git pull I have to copy that directory out
> of my tree and restore the original one before I do a 'git pull' to
> update my tree.
> 
> Thanks,
> Hartley
> _______________________________________________
Hi Hartley,

Why don't you create a feature branches for your stuff, where you can
make commits freely, and track the upstream in another branch. 

Then when one of your feature branches is complete, make a pull request
or send a patch for inclusion in mainline, and delete it after the code
was merged.

Here's a small document that describes such a workflow:
http://www-cs-students.stanford.edu/~blynn/gitmagic/ch04.html

Regards,
Cristi

-- 
Cristi M?gheru?an, alumnus System/Network Engineer
Technical University of Cluj-Napoca, Romania
http://cc.utcluj.ro  +40264 401247
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 198 bytes
Desc: This is a digitally signed message part
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100623/ccb83d24/attachment.pgp>
