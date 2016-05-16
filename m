From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 May 2016 22:03:40 +0200
Subject: [Buildroot] [PATCH v2] stress-ng: update to 0.06.02
In-Reply-To: <20160516081456.GA15481@waldemar-brodkorb.de>
References: <20160516081456.GA15481@waldemar-brodkorb.de>
Message-ID: <20160516220340.1bf31038@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 May 2016 10:14:56 +0200, Waldemar Brodkorb wrote:
> Fixes following autobuilder errors:
> http://autobuild.buildroot.net/results/b527ccdbdfeaba6789528e68df93d9c7216e758a/
> http://autobuild.buildroot.net/results/d658f82c66d93515276dcb6cec8d3690459fbf05/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1->v2: 
>   - upstream made a new release including a bugfix for sparc64 build
>     failure, Thomas Petazzoni agreed via #buildroot, that bumping
>     this package would be okay
> ---
>  package/stress-ng/stress-ng.hash | 2 +-
>  package/stress-ng/stress-ng.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
