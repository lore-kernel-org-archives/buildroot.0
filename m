From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Apr 2021 21:52:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/python3-regex: bump to version
 2021.4.4
In-Reply-To: <20210409090056.6368-1-leon.anavi@konsulko.com>
References: <20210409090056.6368-1-leon.anavi@konsulko.com>
Message-ID: <20210422215252.20e8c774@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  9 Apr 2021 12:00:56 +0300
Leon Anavi <leon.anavi@konsulko.com> wrote:

> Upgrade to release 2021.4.4 with the following bug fixes:
> 
> - regex fails with a quantified backreference but succeeds with
>   repeated backref
> - API is not a drop-in replacement for python's re when it comes
>   to typing
> 
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  package/python-regex/python-regex.hash | 4 ++--
>  package/python-regex/python-regex.mk   | 4 ++--
>  package/python3-regex/python3-regex.mk | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
