From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Oct 2020 22:56:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/mongodb: security bump to
 version 4.2.10
In-Reply-To: <20201011193551.1916306-1-fontaine.fabrice@gmail.com>
References: <20201011193551.1916306-1-fontaine.fabrice@gmail.com>
Message-ID: <20201011225648.2e597ee8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 11 Oct 2020 21:35:51 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> SERVER-50463 Make PooledLDAPConnection::refresh take self-ownership
> 
> https://docs.mongodb.com/manual/release-notes/4.2-changelog/#id1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mongodb/mongodb.hash | 2 +-
>  package/mongodb/mongodb.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
