From: Christian Stewart <christian@paral.in>
Date: Mon, 25 Feb 2019 23:46:18 -0800
Subject: [Buildroot] [PATCH 1/1] package/go: bump to version 1.12
In-Reply-To: <20190226082449.040c7a2a@windsurf.home>
References: <20190226034554.24429-1-christian@paral.in>
 <20190226082449.040c7a2a@windsurf.home>
Message-ID: <CA+h8R2qERZ1EjoyCiSCD32K8KM9m5OS_RdQ3iS59m9UmBUEwYw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Feb 25, 2019 at 11:24 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> I am puzzled by your statement "currently undefined". Is it undefined
> in the sense "it is not defined yet how Buildroot will handle this" or
> "it is not defined in Go yet how the module compilation will work in
> 1.13" ?

The Buildroot approach to handling it is currently not defined. Go
Modules are built around fetching from the network and verifying
downloads within the Go tool itself, while Buildroot likely will avoid
any network calls outside of the official Buildroot download
mechanism.So, something else will have to be designed to fix this.

Best,
Christian
