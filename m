From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 21:53:58 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/libabseil-cpp: bump to
 20200225.2
In-Reply-To: <20200911163409.25778-2-buildroot@heine.tech>
References: <20200911163409.25778-1-buildroot@heine.tech>
 <20200911163409.25778-2-buildroot@heine.tech>
Message-ID: <20200919215358.2e0e41f6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 11 Sep 2020 18:34:07 +0200
Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:

> patch release with two bugfixes
> - fixes the list of dependencies of absl::Cord in the CMake build
> - bug fix for absl::Status::ErasePayload
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/libabseil-cpp/libabseil-cpp.hash | 2 +-
>  package/libabseil-cpp/libabseil-cpp.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Entire series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
