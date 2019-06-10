From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Jun 2019 16:24:57 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/libgit2: security bump to version 0.27.8
In-Reply-To: <20190610090328.28495-1-fontaine.fabrice@gmail.com>
References: <20190610090328.28495-1-fontaine.fabrice@gmail.com>
Message-ID: <da7b22b8-e16a-0cc1-ca76-480647c85aca@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/06/2019 11:03, Fabrice Fontaine wrote:
> Fixing the following list of issues (fixed in 0.27.6 and 0.27.5):

 Applied to master, thanks.

 For the decision of backporting to 2019.0[25].x, though: you only mention fixes
in 0.27.5 and 0.27.6, not in .7 or .8. So does that mean that the stable
branches should update only to 0.27.6?

 Regards,
 Arnout

[snip]
