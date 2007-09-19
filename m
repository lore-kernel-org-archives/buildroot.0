From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 19 Sep 2007 02:08:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/docs
Message-ID: <20070919090810.35FB5A65C2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-19 02:08:10 -0700 (Wed, 19 Sep 2007)
New Revision: 19882

Log:
- trivial style fixes.
  TODO: document HAVE_MANPAGES and HAVE_INFOPAGES (and adjust line-numbers in the text accordingly)


Modified:
   trunk/buildroot/docs/buildroot.html


Changeset:
Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2007-09-19 08:50:54 UTC (rev 19881)
+++ trunk/buildroot/docs/buildroot.html	2007-09-19 09:08:10 UTC (rev 19882)
@@ -899,16 +899,16 @@
     <a name="line18" id="line18">18</a>          touch $@
     <a name="line19" id="line19">19</a>
     <a name="line20" id="line20">20</a>  $(FOO_DIR)/.configured: $(FOO_DIR)/.source
-    <a name="line21" id="line21">21</a>          (cd $(FOO_DIR); rm -rf config.cache ; \
+    <a name="line21" id="line21">21</a>          (cd $(FOO_DIR); rm -rf config.cache; \
     <a name="line22" id="line22">22</a>                  $(TARGET_CONFIGURE_OPTS) \
-    <a name="line23" id="line23">23</a>                  CFLAGS="$(TARGET_CFLAGS)" \
+    <a name="line23" id="line23">23</a>                  $(TARGET_CONFIGURE_ARGS) \
     <a name="line24" id="line24">24</a>                  ./configure \
     <a name="line25" id="line25">25</a>                  --target=$(GNU_TARGET_NAME) \
     <a name="line26" id="line26">26</a>                  --host=$(GNU_TARGET_NAME) \
     <a name="line27" id="line27">27</a>                  --build=$(GNU_HOST_NAME) \
     <a name="line28" id="line28">28</a>                  --prefix=/usr \
     <a name="line29" id="line29">29</a>                  --sysconfdir=/etc \
-    <a name="line30" id="line30">30</a>          );
+    <a name="line30" id="line30">30</a>          )
     <a name="line31" id="line31">31</a>          touch $@
     <a name="line32" id="line32">32</a>
     <a name="line33" id="line33">33</a>  $(FOO_DIR)/$(FOO_BINARY): $(FOO_DIR)/.configured
