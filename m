From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 7 Jan 2020 21:24:05 +0100
Subject: [Buildroot] [PATCH v2,
 1/2] package/leveldb: disable benchmarks and tests
In-Reply-To: <20191227094000.374160-1-fontaine.fabrice@gmail.com>
References: <20191227094000.374160-1-fontaine.fabrice@gmail.com>
Message-ID: <20200107212405.5e2e850a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 27 Dec 2019 10:39:59 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Benchmarks and tests are enabled by default and benchmarks optionally
> depend on sqlite
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Remove trailing backslash

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
