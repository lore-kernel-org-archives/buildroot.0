From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  7 Feb 2019 23:09:12 +0100
Subject: [Buildroot] [PATCH] docs/website: add page for the Buildroot
 Association
Message-ID: <20190207220912.30484-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For about two years, a legal entity called "Buildroot Association" was
created in France to support the Buildroot project. Until fall 2018,
this legal entity has not been used. In fall 2018, we started using it
in order to receive donations from companies in order to organize the
Buildroot Developers Meeting that took place before the Embedded Linux
Conference Europe 2018 in Edinburgh.

This commit creates a new page on our web site that documents the
existence of this Buildroot Association, and details how to become a
member. Both individuals and companies can become members.

It is worth stating that the Buildroot Association does not control
the Buildroot project: it remains a fully open-source and
community-driven project. The Buildroot Association only serves as a
legal entity to handle donations and money needed to organize the
Buildroot Developers Meeting, and pay for a few expenses related to
the project (such as domain names).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/foundation.html | 122 +++++++++++++++++++++++++++++++++++
 docs/website/header.html     |   2 +
 2 files changed, 124 insertions(+)
 create mode 100644 docs/website/foundation.html

diff --git a/docs/website/foundation.html b/docs/website/foundation.html
new file mode 100644
index 0000000000..c25eb42f96
--- /dev/null
+++ b/docs/website/foundation.html
@@ -0,0 +1,122 @@
+<!--#include file="header.html" -->
+
+<div class="container">
+  <div class="row nh"><!-- current sponsor row -->
+    <div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
+      <div class="panel panel-primary">
+	<div class="panel-heading">Foundation</div>
+	<div class="panel-body">
+
+	  <p>The Buildroot open-source project is supported by a
+	  non-profit organization called the <strong>Buildroot
+	  Association</strong>. The goal of this non-profit
+	  organization is <strong>to engage actions to promote, help
+	  develop and democratise the Buildroot project</strong>.</p>
+
+	  <p>This non-profit organization is registered as a legal
+	  entity in France, more precisely as an <em>association loi
+	  1901</em>.</p>
+
+	  <p>This organization can receive funding from members,
+	  donators and sponsors. This funding is then used to:</p>
+
+	  <ul>
+	    <li>Pay for the meeting rooms used during the
+	      bi-yearly Buildroot Developers Meeting;</li>
+	    <li>Pay for travel expenses for contributors
+	      willing to attend the Buildroot Developers
+	      Meeting, and not covered by their employer to do
+	      so;</li>
+	    <li>Pay for renting servers used to host the
+	      Buildroot infrastructure.</li>
+	  </ul>
+
+	  <p>The statutes of the association are available
+	  in <a href="https://raw.githubusercontent.com/buildroot/buildroot-association/master/statuts_fr.txt">French</a>
+	  (official) and
+	  in <a href="https://github.com/buildroot/buildroot-association/blob/master/statutes_en.txt">English</a>
+	  (unofficial translation). The association was declared on
+	  March 14, 2016 to the <em>Pr?fecture de Haute-Garonne</em>
+	  (France) and is registered under the n?W313024278. See this
+	  official <a href="https://github.com/buildroot/buildroot-association/blob/master/pdf/Recepisse_CR.pdf">receipt</a>
+	  from the french authorities.</p>
+
+	  <p>Our accounting is fully public, including the bank
+	  account summaries,
+	  see <a href="https://github.com/buildroot/buildroot-association/tree/master/accounting">accounting</a>. Numerous
+	  other administrative documents related to the association
+	  are available on
+	  its <a href="https://github.com/buildroot/buildroot-association/">Github
+	  repository</a></p>
+	</div>
+      </div>
+
+      <div class="panel panel-primary">
+	<div class="panel-heading">Becoming a member</div>
+	<div class="panel-body">
+
+	  <p>To become a member, an individual or a company simply has
+	  to pay its yearly membership. For an individual, the minimum
+	  membership fee per year is 10 EUR. For a company, the
+	  minimum membership fee per year is 150 EUR. Individuals and
+	  companies are free to give more than the minimum
+	  required.</p>
+
+	  <p>The membership is valid for the current civil year, i.e
+	  any membership fee paid in 2019 is valid in December 31,
+	  2019.</p>
+
+	  <p>Once the membership fee is received, it will be list in
+	  the
+	  association <a href="https://github.com/buildroot/buildroot-association/tree/master/accounting">accounting</a>
+	  files, which serve as the official list of
+	  members. Therefore, members accept that their name and the
+	  amount of their membership fee is made public.</p>
+
+	  <p>There are two possibilities to pay the membership
+	  fee:</p>
+
+	  <ul>
+
+	    <li>A direct wire-transfer to the association bank
+	    account. Since the bank account is located in France, this
+	    is completely free of charge for any person or company
+	    located in the European Union. The IBAN number of the
+	    association bank account is <code>FR53 2004 1010 1615 0958
+	    0P03 772</code></li>
+
+	    <li>A Paypal payment to the association Paypal account,
+	    whose address
+	    is <code>buildroot-association at lists.buildroot.org</code>.</li>
+
+	  </ul>
+
+	</div>
+      </div>
+
+      <div class="panel panel-primary">
+	<div class="panel-heading">Sponsoring the project</div>
+	<div class="panel-body">
+
+	  <p>Companies willing to help the Buildroot project can do so
+	  by making a donation to the <em>Buildroot
+	  Association</em>. In exchange for these donations, companies
+	  will be listed on our <a href="/sponsors.html">Sponsors</a>
+	  page and will be thanked in our release announcements.</p>
+
+	  <p>As the <em>Buildroot Association</em> is a legal entity
+	  registered in France, it is able to deliver a bill and/or
+	  receipt.</p>
+
+	  <p>Please
+	  contact <a href="mailto:buildroot-association@lists.buildroot.org">buildroot-association at lists.buildroot.org</a>
+	  if you are a company interested in making a donation.</p>
+
+	</div>
+      </div>
+
+    </div>
+  </div>
+</div>
+
+<!--#include file="footer.html" -->
diff --git a/docs/website/header.html b/docs/website/header.html
index a6f16e680b..ed4b62a1e5 100644
--- a/docs/website/header.html
+++ b/docs/website/header.html
@@ -43,6 +43,8 @@
 					<span class="glyphicon glyphicon-share"></span> Contribute</a></li>
 				<li><a href="/sponsors.html">
 					<span class="glyphicon glyphicon-usd"></span> Sponsors</a></li>
+				<li><a href="/foundation.html">
+					<span class="glyphicon glyphicon-resize-small"></span> Foundation</a></li>
 				<li><a id="menubutton" class="btn btn-success btn-shrink" href="/download.html">
 					<span class="glyphicon glyphicon-cloud-download"></span>
 					<span class="text-shrink" >Download</span></a></li>
-- 
2.20.1
