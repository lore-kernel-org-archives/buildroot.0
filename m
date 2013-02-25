From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 25 Feb 2013 22:15:11 +0100
Subject: [Buildroot] [PATCH] qt: install QML imports on target
In-Reply-To: <CAHQn0kg71pmwYCTo9EbGZOFF-PO2s99pZ4GrSC2gDbuy31QUqA@mail.gmail.com>
 ("Daniel =?utf-8?Q?Nystr=C3=B6m=22's?= message of "Mon, 25 Feb 2013
 11:31:36 +0100")
References: <1361355531-2909-1-git-send-email-daniel.nystrom@timeterminal.se>
 <CAHQn0kg71pmwYCTo9EbGZOFF-PO2s99pZ4GrSC2gDbuy31QUqA@mail.gmail.com>
Message-ID: <878v6c859c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Nystr?m <daniel.nystrom@timeterminal.se> writes:

 Daniel> On Wed, Feb 20, 2013 at 11:18 AM, Daniel Nystr?m <
 Daniel> daniel.nystrom at timeterminal.se> wrote:

 Daniel>     When selecting the Qt declarative module, all the QML imports was
 Daniel>     built and installed to staging, but never installed to the target.

 Daniel>     Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>


 Daniel> Bumping this patch as I think this is a good candidate for the
 Daniel> 2013.02 release.  Currently QtDeclarative is supported by
 Daniel> Buildroot, but the QML imports are not installed to target. The
 Daniel> current imports are:

 Daniel> ./QtWebKit/libqmlwebkitplugin.so
 Daniel> ./Qt/labs/folderlistmodel/libqmlfolderlistmodelplugin.so
 Daniel> ./Qt/labs/gestures/libqmlgesturesplugin.so
 Daniel> ./Qt/labs/particles/libqmlparticlesplugin.so

It would be good if someone who knows anything about Qt can ack this
patch for 2013.02.

-- 
Bye, Peter Korsgaard
