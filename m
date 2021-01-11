From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Jan 2021 21:32:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/netcat: set NETCAT_CPE_ID_VALID
In-Reply-To: <20210111201544.1414785-1-fontaine.fabrice@gmail.com>
References: <20210111201544.1414785-1-fontaine.fabrice@gmail.com>
Message-ID: <20210111213208.05cb371a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Mon, 11 Jan 2021 21:15:44 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks for all those CPE related patches, very useful. Since you're
doing all those checks, perhaps it would be useful to have a pointer to
something that confirms how you have validated a given CPE. Either in
the commit log, or as a comment in the .mk file? Perhaps a comment in
the commit log is sufficient?

Since you're doing the research, I guess it should be quite easy to add
such a reference in the commit log. Maybe something such as:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anetcat_project%3Anetcat

Note: no need to resend existing patches for this. This is just a
suggestion for future patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
