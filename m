From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 May 2021 21:40:56 +0200
Subject: [Buildroot] [PATCH] docs: move the IRC channel away from Freenode
Message-ID: <20210522194056.1676529-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Due to the recent events at Frenode [0], the channel has become a bit
unreliable (much spammed), and users have started to move away already,
as quite a few other projects have moved their IRC presence away from
Freenode.

There are a few alternatives. The first to spring to mond, is the new
libera.chat network [1], managed by the previous Freenode staff, so we
could expect quite a good experience there. However, it is a very yong
network. The second well known alternative is the long-established OFTC,
which has been very reliable in its 20 years of existence.

So, let's move to OFTC, just because it has a track-record of robustness
(which Libera.Chat still has to build, for being young).

Note: there are a lot of other IRC networks, some very good too, but we
probably would be much off-topic on most of them.

[0] https://lwn.net/Articles/856543/
[1] https://libera.chat/
[2] https://www.oftc.net/

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 README                    |  2 +-
 docs/manual/resources.txt |  4 ++--
 docs/website/support.html | 10 +++++-----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/README b/README
index c6172524d7..008e996f5f 100644
--- a/README
+++ b/README
@@ -20,7 +20,7 @@ Buildroot comes with a basic configuration for a number of boards. Run
 
 Please feed suggestions, bug reports, insults, and bribes back to the
 buildroot mailing list: buildroot at buildroot.org
-You can also find us on #buildroot on Freenode IRC.
+You can also find us on #buildroot on OFTC IRC.
 
 If you would like to contribute patches, please read
 https://buildroot.org/manual.html#submitting-patches
diff --git a/docs/manual/resources.txt b/docs/manual/resources.txt
index 69bfff8f2b..374cdef94e 100644
--- a/docs/manual/resources.txt
+++ b/docs/manual/resources.txt
@@ -29,8 +29,8 @@ there is a good chance someone else has asked the same question before.
 
 IRC::
 +
-The Buildroot IRC channel irc://freenode.net/#buildroot[#buildroot] is
-hosted on http://webchat.freenode.net[Freenode]. It is a useful place to
+The Buildroot IRC channel irc://irc.oftc.net/#buildroot[#buildroot] is
+hosted on https://www.oftc.net/WebChat/[OFTC]. It is a useful place to
 ask quick questions or discuss on certain topics.
 +
 When asking for help on IRC, share relevant logs or pieces of code
diff --git a/docs/website/support.html b/docs/website/support.html
index 6c602b42d2..eef969d461 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -19,15 +19,15 @@
 		  <img class="img-responsive" src="images/irc.png" style="max-width:50px; margin-bottom:10px;">
 		</div>
 		<div class="col-sm-11">
-		  <p>The Buildroot IRC channel is <a href="irc://freenode.net/#buildroot">
-		      #buildroot</a>, hosted on Freenode. If you do not have an IRC client, you can
-		    use the <a href="http://webchat.freenode.net">Freenode web interface</a>.
+		  <p>The Buildroot IRC channel is <a href="irc://irc.oftc.net/#buildroot">
+		      #buildroot</a>, hosted on OFTC. If you do not have an IRC client, you can
+		    use the <a href="https://www.oftc.net/WebChat/">OFTC web interface</a>.
 		    When asking for help on IRC, share relevant logs or pieces of code using a code
 		    sharing website.</p>
 
-		  <p>Note that due to excessive spamming on Freenode, the channel can only be
+		  <p>Note that due to excessive spamming on IRC, the channel can only be
 		    joined if you are a registered user with
-		    <a href="https://freenode.net/kb/answer/registration">Freenode nickserv</a>
+		    <a href="https://www.oftc.net/Services/">OFTC NickServ</a>
 		    service. Follow the instructions to register as a user with a password,
 		    and then join the <code>#buildroot</code> channel.</p>
 		</div>
-- 
2.25.1
