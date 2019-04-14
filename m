From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Apr 2019 17:32:38 +0200
Subject: [Buildroot] [PATCH v8 6/9] cpe-info: update manual for new pkg
 vars
In-Reply-To: <1552082667-46877-7-git-send-email-matthew.weber@rockwellcollins.com>
References: <1552082667-46877-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1552082667-46877-7-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <975646d2-83fc-7560-d529-473054e1817f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/03/2019 23:04, Matt Weber wrote:
> +license text (+LIBFOO_LICENSE_FILES+) and the vendor for vunerability
> +analysis (+LIBFOO_CPE_ID_VENDOR+). All variables must start with

 "for vulnerability analysis" is not entirely correct; it's for product
identification. And of course this would be a full CPE_ID not just a vendor. So
it should become something like

... and the CPE (Common Platform Enumeration) identifier.

 There should be a reference to the cpe-info section as well, but of course that
can be added only after that section has been added.

 Regards,
 Arnout
