From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 18:08:55 +0100
Subject: [Buildroot] [PATCH 3/3] manual: Add notes about GitHub and
 hashes
In-Reply-To: <1414341315-31896-3-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414341315-31896-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1414341315-31896-3-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141026180855.6aa51f07@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun, 26 Oct 2014 17:35:15 +0100, Maxime Hadjinlian wrote:

> +If +libfoo+ is from GitHub, we can only accept +.hash+ file if the
> +package has a release section and the maintainer has uploaded a release
> +tarball. Otherwise, the automated generated tarball may change through
> +time, rendering a +.hash+ file invalid.

I don't really understand this. If the tarball is automatically
generated, then it should always be the same for a given version/tag of
a certain repository, no?

It would be scary if it was not possible to validate the integrity of
all the packages we download from github.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
