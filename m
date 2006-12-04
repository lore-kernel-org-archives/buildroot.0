From: Bernhard Fischer <rep.nop@aon.at>
Date: Mon, 4 Dec 2006 18:23:27 +0100
Subject: [Buildroot] 2.6.16 kernel headers
In-Reply-To: <20061204163723.76850@gmx.net>
References: <20061204152218.171330@gmx.net> <20061204162626.GA25253@aon.at>
	<20061204163723.76850@gmx.net>
Message-ID: <20061204172327.GA25636@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 04, 2006 at 05:37:23PM +0100, "Matthias G?lck" wrote:
>Could you please explain that a little bit more, or point to a link for further informations?

http://uclibc.org/lists/uclibc/2006-February/014549.html
>
>Why are there no headers selectable for kernel 2.6.16?

The last "sanitized" kernel-headers from Mazur are 2.6.12

The kernel grew a headers_install around 2.6.18 (see lkml.org for more
information).

>Is it possible to use the 2.6.12 headers without problems?

yes.
