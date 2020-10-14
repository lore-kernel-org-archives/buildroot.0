From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Oct 2020 19:37:20 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/python3: bump to version
 3.9.0
In-Reply-To: <20201014101848.972915-1-james.hilliard1@gmail.com>
References: <20201014101848.972915-1-james.hilliard1@gmail.com>
Message-ID: <20201014193720.2cfa2a5c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 14 Oct 2020 04:18:48 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Minimal rebase of patches on 3.9.0.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>   - minimal patch set require for bump
>   - add signed off by to patches with syntax changes
> ---
>  ...locale-and-set-to-default-when-addin.patch | 14 +++++----
>  ...-disable-installation-of-test-module.patch | 29 +++++++++++--------
>  .../0014-Add-an-option-to-disable-pydoc.patch | 28 +++++++++---------
>  ...-option-to-disable-the-curses-module.patch | 26 ++++++++---------
>  .../0019-Add-an-option-to-disable-expat.patch | 20 ++++++-------
>  ...024-Add-an-option-to-disable-decimal.patch | 16 +++++-----
>  package/python3/python3.hash                  |  6 ++--
>  package/python3/python3.mk                    |  4 +--
>  8 files changed, 75 insertions(+), 68 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
