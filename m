From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Sep 2018 15:47:06 +0200
Subject: [Buildroot] [git commit] docs/website: add paragraph about the IRC
 channel restrictions
Message-ID: <20180911134626.1C64483DAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8062700e2d48f2914638755961bea6a56f1d5d8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to excessive spamming on Freenode, the IRC channel is currently
restricted to registered users. Since this may not be obvious for
people not familiar with IRC, let's mention it on our website, with a
link to the relevant documentation.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/support.html | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/website/support.html b/docs/website/support.html
index 23a5db794f..1a5ce9e225 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -24,6 +24,12 @@
 		    use the <a href="http://webchat.freenode.net">Freenode web interface</a>.
 		    When asking for help on IRC, share relevant logs or pieces of code using a code
 		    sharing website.</p>
+
+		  <p>Note that due to excessive spamming on Freenode, the channel can only be
+		    joined if you are a registered user with
+		    <a href="https://freenode.net/kb/answer/registration">Freenode nickserv</a>
+		    service. Follow the instructions to register as a user with a password,
+		    and then join the <code>#buildroot</code> channel.</p>
 		</div>
 	      </div>
 	    </div>
