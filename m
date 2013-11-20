From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Nov 2013 18:23:03 +0100
Subject: [Buildroot] [pkg-perl infra 02/12] cpan: a home for Perl modules
In-Reply-To: <1384966920-9454-3-git-send-email-francois.perrad@gadz.org>
References: <1384966920-9454-1-git-send-email-francois.perrad@gadz.org>
 <1384966920-9454-3-git-send-email-francois.perrad@gadz.org>
Message-ID: <20131120182303.3736b65d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Wed, 20 Nov 2013 18:01:50 +0100, Francois Perrad wrote:
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  Config.in            |    7 +
>  package/Config.in    |    1 +
>  package/cpan/cpan.mk |    1 +
>  scancpan             |  629 ++++++++++++++++++++++++++++++++++++++++++++++++++

We quite certainly want this script somewhere under support/scripts/,
in a separate patch from the one adding the BR2_CPAN_MIRROR option and
the package/cpan/ directory. And also, the script needs a comment at
the beginning that explains what it is, what it does, how to use it,
and what is the license of the script (because I see it reuses some
existing code, so we have to figure out if the license of this code is
compatible with the Buildroot license).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
