From: Gordon Smith <spider.karma+busybox.net@gmail.com>
Date: Wed, 11 Nov 2009 14:16:18 -0700
Subject: [Buildroot] Web search forms broken
Message-ID: <2df568dc0911111316i736d2bfdw10a7b9df37232131@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The search forms in
    ${DISTRO_SOURCE}/docs/lists.html
    http://buildroot.uclibc.org/lists.html
do not produce results, for example:

  Your search - Sven Neumann - did not match any documents.


I'd guess the target site is out of date. They use

<form method="GET" action="http://www.google.com/custom">
<input type="hidden" name="sitesearch" value="buildroot.uclibc.org">


The google search
  "site:lists.busybox.net Sven Neumann"
works better:

    Results 1 - 10 of about 146 from lists.busybox.net for Sven Neumann
