From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Apr 2021 23:21:11 +0200
Subject: [Buildroot] [PATCH] package/rsyslog: install default service
 file
In-Reply-To: <20210414210927.1826-1-sam.voss@rockwellcollins.com>
References: <20210414210927.1826-1-sam.voss@rockwellcollins.com>
Message-ID: <20210419232111.0c2aa555@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 14 Apr 2021 16:09:27 -0500
Sam Voss <sam.voss@rockwellcollins.com> wrote:

> As of v8.2008 rsyslog no longer provides a default service file, and now
> suggests using the platform suggested defaults. For Buildroot, install
> the Debian service file which has been added in the same version,
> however is not included in the official release.
> 
> Upstream commit which adds this service file:
> https://github.com/rsyslog/rsyslog/commit/cfd07503ba055100a84d75d1a78a5c6cceb9fdab
> 
> Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>
> ---
>  package/rsyslog/rsyslog.mk      |  5 +++++
>  package/rsyslog/rsyslog.service | 19 +++++++++++++++++++
>  2 files changed, 24 insertions(+)
>  create mode 100644 package/rsyslog/rsyslog.service

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
