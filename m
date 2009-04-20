From: Hamish Moffatt <hamish@cloud.net.au>
Date: Mon, 20 Apr 2009 10:32:49 +1000
Subject: [Buildroot] future of project support
In-Reply-To: <877i1j9zcu.fsf@macbook.be.48ers.dk>
References: <35AF1D2435E24FA6B1C89344B22D099E@apexjs>
	<877i1j9zcu.fsf@macbook.be.48ers.dk>
Message-ID: <20090420003249.GA18066@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 17, 2009 at 03:36:01PM +0200, Peter Korsgaard wrote:
> Because of the project stuff. There's been discussion about getting
> rid of that and simply use the external toolchain stuff if you want to
> build seperate rootfs'es for similar hw, and I'm seriously considering
> doing so.

I'm in favour of some simplification. Here's my usage:

I have a few related projects. I want to build them from the same source
tree. Ideally I can have them all built within one check-out, so I can
quickly make a change and test it in multiple projects (without checking
in, updating the other check out etc).

I don't care if everything is rebuilt for each project.. (except the
toolchain possibly). I think the current mix of build_arch /
project_build_arch is a mess, I'd prefer to have everything in
project_build_arch really.



Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
