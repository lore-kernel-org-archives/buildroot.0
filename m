From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Aug 2015 19:36:28 +0200
Subject: [Buildroot] [PATCH 1/3] perl-www-robotrules: fix dependencies
In-Reply-To: <CAB0FRsvPDX87eMENPA-1qzRBz8y_FyzocMdaQYpL2e4+S_1CaA@mail.gmail.com>
References: <1440527914-9575-1-git-send-email-francois.perrad@gadz.org>
 <20150825205050.119b78ba@free-electrons.com>
 <CAB0FRsvPDX87eMENPA-1qzRBz8y_FyzocMdaQYpL2e4+S_1CaA@mail.gmail.com>
Message-ID: <20150826193628.1425362c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois,

On Wed, 26 Aug 2015 18:49:04 +0200, Fran?ois Perrad wrote:

> A refactor of the Perl infrastructure could happen only after the
> 2015.08 release.
> Theses patches are for fixing the 2015.08 release with the current
> Perl infrastructure.

Ok, understood. But then, don't we also need to fix:

 - perl-http-negotiate
 - perl-http-message
 - perl-file-listing

which, like the three packages you're fixing in this series, don't have
"perl" in their _DEPENDENCIES ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
