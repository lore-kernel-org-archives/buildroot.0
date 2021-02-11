From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Feb 2021 23:15:56 +0100
Subject: [Buildroot] [PATCH] package/protobuf: remove target version of
 'protoc'
In-Reply-To: <20210211104002.31978-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Thu, 11 Feb 2021 11:40:01 +0100")
References: <20210211104002.31978-1-patrickdepinguin@gmail.com>
Message-ID: <8735y2i737.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > The tool 'protoc' and its associated library libprotoc.so are only
 > needed during development, to convert a protocol buffer definition in the
 > associated code for a specific code language.

 > Buildroot does not officially support creating a development environment on
 > target, so remove these files to reduce disk usage by more than 1.5 MB
 > (stripped, uncompressed).

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
