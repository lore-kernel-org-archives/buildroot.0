From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Feb 2021 16:43:23 +0100
Subject: [Buildroot] [PATCH] package/grpc: remove obsolete patch to
 support cross-compiling
In-Reply-To: <20210201205710.12357-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Mon, 1 Feb 2021 21:57:09 +0100")
References: <20210201205710.12357-1-patrickdepinguin@gmail.com>
Message-ID: <87im7aiig4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > When cross-compiling grpc, a native tool 'grpc_cpp_plugin' is needed.
 > Patch '0001-target-build-using-host-plugin.patch' in Buildroot provides a
 > way to pass the path to this tool via a configure option
 > 'gRPC_NATIVE_CPP_PLUGIN'.

 > In version 1.20.0, the upstream grpc project added better support for
 > cross-compiling via commit 0d7a0ded [1], searching for the native
 > grpc_cpp_plugin via PATH (rather than specifying it as configure option as
 > our patch was doing).

 > This change renders the mentioned Buildroot patch obsolete, so remove it.

 > [1] https://github.com/grpc/grpc/commit/0d7a0ded1cc93bb7f4d69a156b0a69829557cbf2

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
