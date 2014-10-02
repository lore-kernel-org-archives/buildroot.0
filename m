From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 2 Oct 2014 16:42:23 -0500
Subject: [Buildroot] [git commit] protobuf: bump version to 2.6.0
In-Reply-To: <20141002205533.3EADC9D7E9@busybox.osuosl.org>
References: <20141002205533.3EADC9D7E9@busybox.osuosl.org>
Message-ID: <CANQCQpZJwWK1t5fKfMO3aT14PNvDYc-XejwiFXaOWpp7xE3zyg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Thu, Oct 2, 2014 at 3:54 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=7b6304af9d69d44ee3040c00b0670f19c02de7d2
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> * Adds powerpc architecture support
> * Changes to the new github upstream site
> * Updates the license filename
>
<snip>
>
> -PROTOBUF_VERSION = 2.5.0
> -PROTOBUF_SITE = http://protobuf.googlecode.com/files
> +PROTOBUF_VERSION = 2.6.0
> +PROTOBUF_SITE = https://github.com/google/protobuf/releases/download/v$(PROTOBUF_VERSION)/

(Just a general comment) I noticed that the github helper didn't work
for this site.  I didn't dig to far into it, but I'm guessing github
now has a couple ways they're hosting release archives?


-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
