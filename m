From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 04 Feb 2021 16:34:20 +0100
Subject: [Buildroot] [PATCH 1/2] package/chartjs: move 'v' version
 prefix out of CHARTJS_VERSION
In-Reply-To: <20210119154607.11101-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Tue, 19 Jan 2021 16:46:04 +0100")
References: <20210119154607.11101-1-patrickdepinguin@gmail.com>
Message-ID: <877dnng83n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > chartjs 2.9.3 has a security vulnerability (CVE-2020-7746) which is not
 > detected by the CVE scripts, presumably because our version variable starts
 > with a 'v'.

 > Move that 'v' prefix out of the version variable to fix that.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
