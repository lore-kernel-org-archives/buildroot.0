From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Feb 2017 23:05:40 +0100
Subject: [Buildroot] [PATCH 1/2] wavpack: fetch upstream patch to remove
	wchar dependency
In-Reply-To: <20170219150013.11728-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Sun, 19 Feb 2017 16:00:12 +0100")
References: <20170219150013.11728-1-joerg.krause@embedded.rocks>
Message-ID: <87lgt1rg3v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > The recent bump to version 5.1.0 added a dependency on wchar:
 > ```
 > import_id3.c:37:34: error: unknown type name 'wchar_t'
 > ```

 > This issue has been reported upstream [1] and a fix was commited by
 > upstream to remove the wchar dependency [2].

 > Fixes:
 > http://autobuild.buildroot.net/results/9a6/9a693f5b798571917f36cfb7661e2f2638aac550/
 > http://autobuild.buildroot.net/results/44c/44c8227043045baf4f043da44b8129e43dfff687/
 > http://autobuild.buildroot.net/results/a80/a80221dcc0860046ebdf0bbf454e056b1e20df83/
 > .. and more.

 > The build was successfully tested with the 'br-arm-basic-2017.02-rc1-2-g133c5ac'
 > toolchain.

 > [1] https://github.com/dbry/WavPack/issues/19
 > [2] https://github.com/dbry/WavPack/commit/876fc3f3907e871d0938ac6c8c5252f5f31abd1f

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed, thanks.

-- 
Bye, Peter Korsgaard
