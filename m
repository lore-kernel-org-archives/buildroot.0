From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Jul 2014 09:40:17 -0300
Subject: [Buildroot] [PATCH 2/3] infra: add gettextize run in AUTORECONF
In-Reply-To: <20140714123048.GB3684@free.fr>
References: <1405186024-8170-1-git-send-email-gustavo@zacarias.com.ar>
 <1405186024-8170-2-git-send-email-gustavo@zacarias.com.ar>
 <20140714130104.480ab4cf@free-electrons.com> <20140714123048.GB3684@free.fr>
Message-ID: <53C3CFB1.8070101@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/14/2014 09:30 AM, Yann E. MORIN wrote:
> Should I revive the series I did a while ago, that did just that?

A couple of fixes:
It needs the filter-out addition for host-gettext in
package/pkg-autotools.mk (like AUTORECONF does), and probably a tiny
mention that GETTEXTIZING without AUTORECONF is useless.
Also we might be able to filter gettextizing out when
gettext/host-gettext aren't pulled in - no infra version mismatch to
account for, hence time savings.
Regards.
