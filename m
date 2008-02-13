From: Darcy Watkins <DWatkins@tranzeo.com>
Date: Wed, 13 Feb 2008 10:14:29 -0800
Subject: [Buildroot] pciutils-2.2.6 fails to build for powerpc  405
In-Reply-To: <D61182AC8012EA4EBC531B3AF23BE1095020F0@tranzeo-mail2.12stewart.tranzeo.com>
References: <D61182AC8012EA4EBC531B3AF23BE1093F1374@tranzeo-mail2.12stewart.tranzeo.com><20070913092615.GA15641@aon.at>
	<D61182AC8012EA4EBC531B3AF23BE1093F1421@tranzeo-mail2.12stewart.tranzeo.com>
	<D61182AC8012EA4EBC531B3AF23BE1095020F0@tranzeo-mail2.12stewart.tranzeo.com>
Message-ID: <D61182AC8012EA4EBC531B3AF23BE1095020F3@tranzeo-mail2.12stewart.tranzeo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The submitted patch may also address bug #1904 "Impossible to build
pciutils for mipsel architecture"

Regards,

Darcy

-----Original Message-----
From: Darcy Watkins 
Sent: Wednesday, February 13, 2008 10:06 AM
To: buildroot at uclibc.org
Cc: 'mj at ucw.cz'
Subject: RE: [Buildroot] pciutils-2.2.6 fails to build for powerpc 405

Hello,

Included / attached is patch to allow pciutils to cross compile under
buildroot for non i386 architectures.  I believe that the pciutils
package will natively compile for non i386 architectures.  It failed to
cross compile due to the use of 'uname' on the build machine by the
configure script to attempt to determine system information that applies
to the target machine.

--snip!--
