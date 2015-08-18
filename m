From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 11:44:53 +0200
Subject: [Buildroot] [PATCH 3/3] package/rpm: add host variant
In-Reply-To: <1439486091-6564-3-git-send-email-james.knight@rockwellcollins.com>
References: <1439486091-6564-1-git-send-email-james.knight@rockwellcollins.com>
 <1439486091-6564-3-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <20150818114453.05e19fae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear James Knight,

On Thu, 13 Aug 2015 13:14:51 -0400, James Knight wrote:
> The following adds support for a host variant of the rpm package. This
> support will allow a host system to setup/manipulate a target system's
> initial RPM database during the post-build phase.

It is rather unclear why, in the context of Buildroot, a host RPM would
be needed, and why an initial RPM database would have to be setup. Can
you expand on this?

Also, same comments as for beecrypt and neon.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
