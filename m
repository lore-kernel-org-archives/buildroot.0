From: Maxime Petazzoni <maxime.petazzoni@bulix.org>
Date: Tue, 18 Jan 2011 10:20:07 -0800
Subject: [Buildroot] beagleboard support
In-Reply-To: <895970.43224.qm@web161805.mail.bf1.yahoo.com>
References: <895970.43224.qm@web161805.mail.bf1.yahoo.com>
Message-ID: <20110118182007.GD9083@bulix.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Steve,

* Steve Calfee <nospamcalfee@yahoo.com> [2011-01-17 17:06:51]:

> I found a patch from last may proposing a beagleboard defconfig, but it is not 
> in my 11/10 release of buildroot. Does anyone know the status of beagleboard 
> support?

AFAIK BeagleBoard support has not been merged in yet. The patch from
last May is being progressively reworked. I recently submitted a patch
for X-Loader support which is a pre-requesite to BeagleBoard support. We
then need to implement building a kernel from Git instead of from a
released tarball (kernel trees with BeagleBoard support are usually not
tarballed), and finally we can add the board support.

I haven't heard anything back on my X-Loader support patch though, but I
guess everyone is pretty busy in the beginning of the new year.

- Maxime
-- 
Maxime Petazzoni <http://www.bulix.org>
 ``One by one, the penguins took away my sanity.''
Writing software in California
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 198 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110118/62c702c6/attachment.asc>
