From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Feb 2018 23:39:57 +0100
Subject: [Buildroot] [PATCH v2] erlang: enable host-erlang for
 x86/x86_64 architectures only
In-Reply-To: <20180226165838.9793-1-johan.oudinet@gmail.com> (Johan Oudinet's
 message of "Mon, 26 Feb 2018 17:58:38 +0100")
References: <20180226165838.9793-1-johan.oudinet@gmail.com>
Message-ID: <87h8q3qssi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Johan" == Johan Oudinet <johan.oudinet@gmail.com> writes:

 > And make erlang depends on host-erlang.
 > This patch aims at avoiding the following autobuilder failures:
 > http://autobuild.buildroot.net/results/45edf95c0c44c9d553879e0cbb771098d7c63aa1
 > http://autobuild.buildroot.net/results/a36d00407a371d70b4551a9717ebd6ff852c8bca

 > Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
 > ---
 > Changes v1 -> v2:
 >   - Add references to autobuilder failures (suggested by Baruch Siach).

Committed, thanks.

-- 
Bye, Peter Korsgaard
