From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Aug 2019 11:48:16 +0200
Subject: [Buildroot] [PATCH v2 1/1] c-capnproto: add package
In-Reply-To: <20181023220033.13572-1-JoelsonCarl@gmail.com>
References: <20181023220033.13572-1-JoelsonCarl@gmail.com>
Message-ID: <d7d06dde-a2cc-9d69-3b76-268b543a6d51@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24/10/2018 00:00, Joel Carlson wrote:
> Adds the c-capnproto package. This creates a C plugin for the regular
> capnproto capnpc compiler. It supports only serialization (no RPC).
> 
> Since it depends on capnproto, the package selects capnproto and has the
> same requirements as capnproto.
> 
> Includes a patch submitted upstream to fix a compilation error hit by
> some toolchains.
> 
> Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>

 Finally applied to master, with some changes:

     - use latest upstream version which has patch already applied;
     - mark in Config.in that dependencies come from capnproto;
     - add some newlines to .mk file;
     - updated commit message.

 Regards,
 Arnout
