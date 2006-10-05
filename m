From: Thomas Lundquist <lists@zelow.no>
Date: Thu, 5 Oct 2006 09:29:07 +0200
Subject: [Buildroot] LZMA in Buldroot.
In-Reply-To: <20061004192606.GO17455@aon.at>
References: <20061003173002.GA19937@zelow.no> <20061004084732.GA15165@aon.at>
	<20061004144046.GA32537@zelow.no> <20061004162028.GA18682@aon.at>
	<20061004163742.GA2306@zelow.no> <20061004192606.GO17455@aon.at>
Message-ID: <20061005072907.GA17753@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 04, 2006 at 09:26:07PM +0200, Bernhard Fischer wrote:
> >
> >as snipped out from the original lzma.mk, it's commented out which is
> 
> Yes, i left it commented out. I had (and still have) trouble with c++
> due to an alleged bug with libtool on my ubuntu devel host.

I don't think you're the only one.

BTW; we should have uClibc++ available in buildroot. maybe I'll look at
it. (I haven't seen it, maybe I'm just blind?)

> Yes, i do and will add it too when i have verified and applied your
> diff. No timeframe on checking it, though.
> 
> If you find the time to add the rule for the header(s), then i'll
> blindly apply your take 3 patch see if i need any additional changes.
> I don't know if anybody except me does currently use lzma via buildroot
> on their targets, so i do not feel obligued to be exceptionally stable
> at that end..

I use LZMA on my target (ARM9 but also floppyfw, which is intel and buld
using a devkit build by buildroot...), so you're not the only one :=)

BTW, I had lzma in buildroot some time ago but I've been using the SDK
directly and not the lzma-utils, which are a derivative. I have to admit
I am a bit unsure if lzma-utils is the right thing altho it's more
compatible option wise. (which could be fixed by a wrapper script).

but now we use lzma-utils and I am digressing alot.

You can, if you want to, wait with applying the patch and I'll verify it 
myself (have to admit I havent after moving it from toolchain to package.) 
and also add the lzma-headers back in.


Thomas.
